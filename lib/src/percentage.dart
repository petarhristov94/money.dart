import '../money2.dart';

/// Helper class to allow us to do percentage
/// calculations on Money amounts.
/// Percentage is described as a decimal [Fixed]
/// so 20% is expressed as 0.2
class Percentage extends Fixed {
  /// Creates a percentage.
  /// Pass 20 to get 20%
  /// For 20.5% (0.205) use:
  /// ```
  /// Percentage(205, decimals: 3);
  /// ```
  // ignore: matching_super_parameters
  Percentage(super.percentage, {int decimalDigits = 2})
      : super.fromInt(scale: decimalDigits);

  Percentage.fromFixed(Fixed fixed)
      : super.fromBigInt(fixed.minorUnits, scale: fixed.scale);

  factory Percentage.tryParse(String amount, {int decimalDigits = 2}) {
    Fixed fixed;
    if (amount.trim().isEmpty) {
      fixed = Fixed.zero;
    } else {
      fixed = Fixed.tryParse(amount, scale: decimalDigits) ?? Fixed.zero;
    }

    return Percentage(fixed.minorUnits.toInt(), decimalDigits: fixed.scale);
  }
  factory Percentage.fromInt(int? amount, {int decimalDigits = 2}) {
    final fixed = Fixed.fromInt(amount ?? 0, scale: decimalDigits);

    return Percentage(fixed.minorUnits.toInt(), decimalDigits: fixed.scale);
  }

  int get decimalDigits => super.scale;

  static final Percentage zero = Percentage(0, decimalDigits: 3);
  static final Percentage ten = Percentage(100, decimalDigits: 3);
  static final Percentage twenty = Percentage(200, decimalDigits: 3);
  static final Percentage onehundred = Percentage(1000, decimalDigits: 3);

  @override
  String toString() => '${super.toString()}%';
}
