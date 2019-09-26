/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2016 - 2019 LitGroup LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'dart:math';

// import 'package:meta/meta.dart' show sealed, immutable;

/// Value-type representing a currency.
///
/// **NOTE: This is a value type, do not extend or re-implement it.**
///
/// Money2 does not create a default set of currencies instead you need to explicitly
/// create each currency type you want to use.
///
/// Normally you create one global currency instance for each currency type.
/// If you wish you can register each Currency instance with the Currencies
/// which then is able to provides a global directory of Currency instances.
///
//@sealed
// @immutable
class Currency {
  /// The code of the currency (e.g. 'USD').
  final String code;

  final String symbol;

  /// The number of decimals for the currency (zero or more).
  final int minorDigits;

  // The factor of 10 to divide a minor value by to get the intended currency value.
  // e.g. if minorDigits is 1 then this value will be 100.
  final BigInt minorDigitsFactor;

  final String defaultPattern;

  /// Creates a currency with a given [code] and [minorDigits].
  /// [code - the currency code e.g. USD
  /// [minorDigits] - the number of digits after the decimal place the the currency uses. e.g. 2 for USD as it uses cents to 2 digits.
  /// [defaultPattern] - the default output format used when you call toString on a Money instance created with this currency.
  Currency.create(this.code, this.minorDigits,
      {this.symbol = '\$', this.defaultPattern = "S#.##"})
      : minorDigitsFactor = Currency._calcMinorDigitsFactor(minorDigits) {
    if (code == null || code.isEmpty) {
      throw ArgumentError.value(code, 'code', 'Must be a non-empty string.');
    }

    if (defaultPattern == null) {
      throw ArgumentError.value(
          minorDigits, 'defaultPattern', 'Must not be null.');
    }
  }

  @override
  int get hashCode => code.hashCode;

  @override
  bool operator ==(dynamic other) =>
      other is Currency &&
      code == other.code &&
      minorDigits == other.minorDigits;

  static BigInt _calcMinorDigitsFactor(int minorDigits) {
    if (minorDigits == null || minorDigits.isNegative) {
      throw ArgumentError.value(
          minorDigits, 'minorDigits', 'Must be a non-negative value.');
    }
    return BigInt.from(pow(10, minorDigits));
  }
}
