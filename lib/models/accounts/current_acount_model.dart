import 'package:bank_challenge/models/accounts/account_model.dart';
import 'package:bank_challenge/models/cards/card_model.dart';
import 'package:bank_challenge/models/cards/debit_and_credit_card_model.dart';
import 'package:bank_challenge/models/cards/debit_card_model.dart';

class CurrentAccount extends Account {
  CurrentAccount({
    required super.user,
    required super.bank,
    required super.balance,
    required super.cardType,
  }) {
    card = _createCard();
  }

  void applyForLoan(double value) {
    balance += value;
  }

  Card _createCard() {
    if (cardType == CardType.debit) {
      return DebitCard(
        userName: user.name,
      );
    } else {
      return DebitAndCreditCard(
        userName: user.name,
        creditLimit: _calculateCreditCardLimit(),
      );
    }
  }

  double _calculateCreditCardLimit() {
    if (user.monthlyIncome != null) {
      return user.monthlyIncome! * 0.3;
    } else {
      return 200.0;
    }
  }
}
