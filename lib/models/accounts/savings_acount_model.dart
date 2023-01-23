import 'dart:async';
import 'package:bank_challenge/models/accounts/account_model.dart';
import 'package:bank_challenge/models/cards/debit_card_model.dart';
import 'package:meta/meta.dart';

class SavingsAccount extends Account {
  SavingsAccount({
    required super.user,
    required super.bank,
    required super.balance,
  }) {
    card = DebitCard(userName: user.name);
    renderSavings();
  }

  @visibleForTesting
  void renderSavings() {
    Timer.periodic(Duration(days: 1), (timer) {
      balance += balance * 0.001;
    });
  }
}
