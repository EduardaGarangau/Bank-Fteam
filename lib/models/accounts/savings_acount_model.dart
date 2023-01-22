import 'dart:async';
import 'package:bank_challenge/models/accounts/account_model.dart';
import 'package:bank_challenge/models/cards/debit_card_model.dart';

class SavingsAccount extends Account {
  SavingsAccount({
    required super.user,
    required super.bank,
    required super.balance,
  }) {
    card = DebitCard(userName: user.name);
    _renderSavings();
  }

  void _renderSavings() {
    Timer.periodic(Duration(hours: 24), (timer) {
      balance += balance * 0.0001;
    });
  }
}
