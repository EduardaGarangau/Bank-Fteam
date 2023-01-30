import 'dart:io';
import 'package:bank_challenge/inputs/cards_input/debit_card_input.dart';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/inputs/menus_input/savings_account_menu.dart';
import 'package:bank_challenge/models/accounts/savings_acount_model.dart';
import 'package:bank_challenge/validations/account_validations.dart';
import '../../models/cards/debit_card_model.dart';
import '../../models/user_model.dart';

class SavingsAccountInput {
  final User user;
  final accountValidations = AccountValidations();
  Map<String, dynamic> savingsAccountData = {};

  SavingsAccountInput({required this.user});

  void createSavingsAccount() {
    InputMessages.savingsAccountTitleMessage();
    _bankInput();
    final account = SavingsAccount(
      user: user,
      bank: savingsAccountData['bank'],
      card: savingsAccountData['card'],
    );
    InputMessages.savingsAccountCreatedMessage();
    SavingsAccountMenuInput(account: account).startMenu();
  }

  void _bankInput() {
    stdout.writeln('Digite os três digitos de um banco de sua escolha:');
    final bank = stdin.readLineSync();
    if (accountValidations.validateBank(bank)) {
      savingsAccountData['bank'] = bank;
      savingsAccountData['card'] = _createDebitCard();
    } else {
      stderr.writeln('Banco inválido. Tente novamente');
      _bankInput();
    }
  }

  DebitCard _createDebitCard() {
    stdout.writeln('\n**Conta Poupança só tem direito ao Cartão de Débito**');
    return DebitCardInput(user: user).createDebitCard();
  }
}
