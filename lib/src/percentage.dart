import '../money2.dart';

/// Helper class to allow us to do percentage
/// calculations on Money amounts.
/// Percentage is described as a decimal [Fixed]
/// so 20% is expressed as 20.0
class Percentage extends Fixed {
  /// Creates a percentage.
  /// Pass 20 to get 20%
  /// For 20.5% (0.205) use:
  /// ```dart
  /// Percentage(20, decimals: 0) == 20%;
  /// Percentage(205, decimals: 1) == 20.5%;
  /// ```
  // ignore: matching_super_parameters
  Percentage(super.percentage, {int decimalDigits = 2})
      : super.fromInt(scale: decimalDigits);

  /// Creates a percentage from an int.
  /// ```dart
  /// Percentage.fromInt(10, decimalDigits:0) === 10%
  /// Percentage.fromInt(10, decimalDigits:2) === 0.10%
  /// ```
  factory Percentage.fromInt(int? amount, {int decimalDigits = 2}) {
    final fixed = Fixed.fromInt(amount ?? 0, scale: decimalDigits);

    return Percentage(fixed.minorUnits.toInt(), decimalDigits: fixed.scale);
  }

  Percentage.fromFixed(Fixed fixed)
      : super.fromBigInt(fixed.minorUnits, scale: fixed.scale);

  /// Parses [amount] as a percentage returning null
  /// if [amount] is not a valid number.
  ///
  /// ```dart
  /// Parse.tryParse('10') == 10%
  /// Parse.tryParse('0.10') == 0.10%
  /// ```
  static Percentage? tryParse(String amount, {int decimalDigits = 2}) {
    Fixed? fixed;
    if (amount.trim().isEmpty) {
      fixed = Fixed.zero;
    } else {
      fixed = Fixed.tryParse(amount, scale: decimalDigits);
    }

    if (fixed == null) {
      return null;
    }

    return Percentage(fixed.minorUnits.toInt(), decimalDigits: fixed.scale);
  }

  /// Returns a new [Percentage] value from an existing one
  /// changing the scale to [scale].
  @override
  Percentage copyWith({int? scale}) =>
      Percentage.fromFixed(super.copyWith(scale: scale));

  int get decimalDigits => super.scale;

  static final Percentage zero = Percentage(0, decimalDigits: 3);
  static final Percentage ten = Percentage(100, decimalDigits: 3);
  static final Percentage twenty = Percentage(200, decimalDigits: 3);
  static final Percentage onehundred = Percentage(1000, decimalDigits: 3);

  @override
  String toString() => '${super.toString()}%';
}
