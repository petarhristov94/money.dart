import 'package:money2/money2.dart';
import 'package:test/test.dart';

void main() {
  final amount = '${'9' * 100}.${'9' * 100}';
  final minorUnits = '9' * 200;

  test('Money serialization', () {
    final c = Currency.create('c100', 100, symbol: '=100=');
    Currencies().register(c);
    final m0 = Money.parseWithCurrency(amount, c);
    final json = m0.toJson();
    final m1 = Money.fromJson(json);
    expect(m0.integerPart, m1.integerPart);
    expect(m0.decimalPart, m1.decimalPart);
    expect(m1.compareTo(m0), 0);
    expect(m1.minorUnits, BigInt.parse(minorUnits));
  });
}
