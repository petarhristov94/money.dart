import 'package:money2/money2.dart';
import 'package:test/test.dart';

void main() {
  test('percentage', () {
    final onehundred = Money.fromInt(100000, isoCode: 'AUD', decimalDigits: 3);
    final ten = Money.fromInt(1000, isoCode: 'AUD', decimalDigits: 2);

    var percentage = ten.percentageOf(onehundred);
    expect(percentage, equals(Fixed.fromInt(10)));
    expect(percentage.scale, equals(onehundred.decimalDigits));

    final thirtyThree = Money.fromInt(3, isoCode: 'AUD', decimalDigits: 0);

    percentage = thirtyThree.percentageOf(onehundred);
    expect(percentage, equals(Fixed.fromInt(333, scale: 3)));
    expect(percentage.scale, equals(onehundred.decimalDigits));
  });
}
