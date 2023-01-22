import 'package:bank_challenge/models/cards/card_model.dart';

class DebitAndCreditCard extends Card {
  DebitAndCreditCard({
    required double creditLimit,
    required super.userName,
  }) {
    super.limit = creditLimit;
    super.amoutSpent = 0.0;
  }

  @override
  void buyWithCreditCard(double value) {
    if (value <= limit! && limit != 0.0) {
      amoutSpent += value;
      limit = limit! - value;
    } else {
      throw Exception('Sem limite no cartão de crédito!');
    }
  }
}
