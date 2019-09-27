import 'package:money2/money2.dart';

void main() {
  final usd = Currency.create('USD', 2);

  final Currency aud = Currency.create('AUD', 2, symbol: '\$', pattern: 'S0.00');
  Money audMoney = Money.fromInt(500, aud);
  audMoney.toString();
  // > $5.00

  final Currency jpy = Currency.create('JPY', 0, symbol: '¥', pattern: 'S0');
    Money jpyMoney = Money.fromInt(500, jpy);
  jpyMoney.toString();
  // > ¥500

  final Currency euro = Currency.create('EUR', 2,
      symbol: '€', invertSeparators: true, pattern: "S0,00");

  Money costPrice = Money.fromInt(10034530, usd); // 100,345.30 usd

  costPrice.format("###,###");
// > 100,345

  costPrice.format("S###,###.##");
// > $100,345.3

  costPrice.format("CC###,###.#0");
// > US100,345.30

  Money euroCostPrice = Money.fromInt(10034530, euro); // 100,345.30 EUR

  euroCostPrice.format("###.###");
// > 100.345

  euroCostPrice.format("S###.###,##");
// > €100.345,3

  euroCostPrice.format("CC###.###,#0");
// > EU100,345,30
}
