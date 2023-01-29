import 'package:bank_challenge/models/cards/card_model.dart';

class DebitCard extends Card {
  DebitCard({
    required super.user,
    required super.flag,
    required super.expirationDate,
  });

  @override
  String toString() {
    return '| CARTÃO DE DÉBITO |\nNome: ${user.name}\nNumero: ${super.number}\nCVV: ${super.cvv}\nBandeira: $flag\nData de Valiade: $expirationDate';
  }

  @override
  void buyWithCredit(double value) {}

  @override
  double buyWithDebit(double value, double balance) {
    balance -= value;
    return balance;
  }
}
