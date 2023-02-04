import 'dart:io';
import 'package:bank_challenge/inputs/card_inputs/debit_card_input.dart';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/inputs/menu_inputs/savings_account_menu_input.dart';
import 'package:bank_challenge/models/accounts/savings_acount_model.dart';
import 'package:bank_challenge/models/cards/card_model.dart';
import 'package:bank_challenge/models/cards/debit_card_model.dart';
import 'package:bank_challenge/models/user_model.dart';
import '../../validations/account_validations/bank_validation.dart';

class SavingsAccountInput {
  final User user;
  late String bank;
  late Card card;

  SavingsAccountInput(this.user);

  void createSavingsAccount() {
    InputMessages.savingsAccountTitleMessage();
    inputBank();
    final account = SavingsAccount(
      user: user,
      bank: bank,
    );
    account.card = card as DebitCard;
    InputMessages.savingsAccountCreatedMessage();
    SavingsAccountMenuInput(account).startMenu();
  }

  void inputBank() {
    stdout.writeln('Digite os três dígitos de um banco de sua escolha:');
    final input = stdin.readLineSync();
    final isValid = BankValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputBank();
    } else {
      bank = input!;
      card = DebitCardInput(user).createDebitCard();
    }
  }
}