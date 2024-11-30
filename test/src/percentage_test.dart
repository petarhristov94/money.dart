import 'package:money2/src/percentage.dart';
import 'package:test/test.dart';

void main() {
  test('percentage ...', () async {
    var percentage = Percentage(100, decimalDigits: 3);
    expect(percentage.integerPart.toInt(), equals(0));
    expect(percentage.decimalPart.toInt(), equals(100));
    expect(percentage.scale, equals(3));

    // 100 %
    percentage = Percentage.tryParse('100', decimalDigits: 0);
    expect(percentage.integerPart.toInt(), equals(100));
    expect(percentage.decimalPart.toInt(), equals(0));
    expect(percentage.scale, equals(0));
    expect(percentage.toString(), equals('100%'));

    /// 20.5%
    percentage = Percentage.tryParse('20.5', decimalDigits: 3);
    expect(percentage.integerPart.toInt(), equals(20));
    expect(percentage.decimalPart.toInt(), equals(500));
    expect(percentage.decimalDigits, equals(3));
    expect(percentage.toString(), equals('20.500%'));

    ///
    percentage = Percentage.fromInt(205);
    expect(percentage.integerPart.toInt(), equals(2));
    expect(percentage.decimalPart.toInt(), equals(5));
    expect(percentage.decimalDigits, equals(2));

    expect(percentage.toString(), equals('2.05%'));
  });
}
