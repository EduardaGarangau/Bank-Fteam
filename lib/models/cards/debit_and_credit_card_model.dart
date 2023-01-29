import 'package:bank_challenge/models/cards/card_model.dart';

class DebitAndCreditCard extends Card {
  final double userMontlyIncome;

  DebitAndCreditCard({
    required super.user,
    required super.flag,
    required super.expirationDate,
    required this.userMontlyIncome,
  }) {
    super.limit = _setLimitByMontlyIncome(userMontlyIncome);
  }

  @override
  void buyWithCredit(double value) {
    amoutSpent += value;
    limit = limit - value;
  }

  @override
  double buyWithDebit(double value, double balance) {
    balance -= value;
    return balance;
  }

  double _setLimitByMontlyIncome(double userMontlyIncome) {
    if (userMontlyIncome < 1000) {
      return limit = userMontlyIncome * 0.1;
    } else if (userMontlyIncome >= 1000 && userMontlyIncome < 2500) {
      return limit = userMontlyIncome * 0.25;
    } else if (userMontlyIncome >= 2500 && userMontlyIncome < 5000) {
      return limit = userMontlyIncome * 0.4;
    } else if (userMontlyIncome >= 5000 && userMontlyIncome < 10000) {
      return limit = userMontlyIncome * 0.6;
    } else {
      return limit = userMontlyIncome * 0.75;
    }
  }

  @override
  String toString() {
    return '| CARTÃO DE DÉBITO e CRÉDITO |\nNome: ${user.name}}\nNumero: ${super.number}\nCVV: ${super.cvv}\nBandeira: $flag\nData de Valiade: $expirationDate\nLimite: $limit';
  }
}
