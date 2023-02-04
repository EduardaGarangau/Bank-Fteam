import 'package:bank_challenge/models/cards/card_model.dart';

class DebitAndCreditCard extends Card {
  DebitAndCreditCard({
    required super.user,
    required super.flag,
    required super.expirationDate,
  }) {
    super.limit = _setLimitByMontlyIncome(user.montlyIncome!);
  }

  double _setLimitByMontlyIncome(double montlyIncome) {
    if (montlyIncome < 1000) {
      return montlyIncome * 0.1;
    } else if (montlyIncome >= 1000 && montlyIncome < 2500) {
      return montlyIncome * 0.25;
    } else if (montlyIncome >= 2500 && montlyIncome < 5000) {
      return montlyIncome * 0.4;
    } else if (montlyIncome >= 5000 && montlyIncome < 10000) {
      return montlyIncome * 0.6;
    } else {
      return montlyIncome * 0.75;
    }
  }
}
