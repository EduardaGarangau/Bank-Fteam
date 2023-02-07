import 'dart:io';
import 'package:bank_challenge/inputs/card_inputs/debit_card_input.dart';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/models/accounts/savings_acount_model.dart';
import 'package:bank_challenge/models/cards/card_model.dart';
import 'package:bank_challenge/models/cards/debit_card_model.dart';
import 'package:bank_challenge/models/user_model.dart';
import '../../validations/account_validations/bank_validation.dart';

class SavingsAccountInput {
  final UserModel user;
  late String bank;
  late CardModel card;

  SavingsAccountInput(this.user);

  SavingsAccountModel createSavingsAccount() {
    InputMessages.savingsAccountTitleMessage();
    _inputBank();
    final account = SavingsAccountModel(
      user: user,
      bank: bank,
      card: card,
    );
    InputMessages.savingsAccountCreatedMessage();
    return account;
  }

  void _inputBank() {
    stdout.writeln('Digite os três dígitos de um banco de sua escolha:');
    final input = stdin.readLineSync();
    final isValid = BankValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputBank();
    } else {
      bank = input!;
      card = DebitCardInput(user).createDebitCard();
    }
  }
}
