/* Copyright (C) S. Brett Sutton - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Brett Sutton <bsutton@onepub.dev>, Jan 2022
 */

import 'package:money2/money2.dart';
import 'package:test/test.dart';

void main() {
  group('group separators', () {
    test('Default Currency Pattern', () {
      final inr10d25 = Money.parse('₹10.25', isoCode: 'INR');
      final inr10 = Money.parse('₹10', isoCode: 'INR');
      final inrLarge = Money.parse('₹10000000', isoCode: 'INR');
      final inrveryLarge = Money.parse('₹1000000000', isoCode: 'INR');

      expect(inr10d25.toString(), equals('₹10.25'));
      expect(inr10.format('#.0#'), equals('10.0'));
      expect(inrLarge.format(), equals('₹1,00,00,000.00'));
      expect(inrveryLarge.format(), equals('₹1,00,00,00,000.00'));
    });
  });
}
