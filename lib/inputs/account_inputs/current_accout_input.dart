import 'dart:io';

import 'package:bank_challenge/inputs/card_inputs/debit_and_credit_card_input.dart';
import 'package:bank_challenge/inputs/menu_inputs/current_account_menu_input.dart';
import 'package:bank_challenge/models/accounts/current_acount_model.dart';
import 'package:bank_challenge/validations/account_validations/bank_validation.dart';

import '../../models/cards/card_model.dart';
import '../../models/user_model.dart';
import '../card_inputs/debit_card_input.dart';
import '../input_messages.dart';

class CurrentAccountInput {
  final User user;
  late String bank;
  late Card card;

  CurrentAccountInput(this.user);

  void createCurrentAccount() {
    InputMessages.currentAccountTitleMessage();
    inputBank();
    final account = CurrentAccount(
      user: user,
      bank: bank,
    );
    account.card = card;
    InputMessages.currentAccountCreatedMessage();
    CurrentAccountMenuInput(account).startMenu();
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
      user.montlyIncome == null
          ? card = DebitCardInput(user).createDebitCard()
          : chooseCard();
    }
  }

  void chooseCard() {
    stdout.writeln('Escolha um cartão:');
    stdout.writeln('1 - Cartão de Débito');
    stdout.writeln('2 - Cartão de Débito e Crédito');
    final input = stdin.readLineSync();

    if (input == '1') {
      card = DebitCardInput(user).createDebitCard();
    } else if (input == '2') {
      card = DebitAndCreditCardInput(user).createDebitAndCreditCard();
    } else {
      stderr.writeln('Opção incorreta. Tente novamente!');
      chooseCard();
    }
  }
}
