import 'dart:io';
import 'package:bank_challenge/inputs/cards_input.dart/debit_card_input.dart';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/models/accounts/savings_acount_model.dart';
import 'package:bank_challenge/validations/account_validations.dart';
import '../../models/cards/debit_card_model.dart';
import '../../models/user_model.dart';

class SavingsAccountInput {
  final User user;
  final accountValidations = AccountValidations();
  Map<String, dynamic> savingsAccountData = {};

  SavingsAccountInput({required this.user});

  SavingsAccount createSavingsAccount() {
    stdout.writeln('\n--CONTA POUPANÇA--');
    _bankInput();
    final account = SavingsAccount(
      user: user,
      bank: savingsAccountData['bank'],
      card: savingsAccountData['card'],
    );
    InputMessages.savingsAccountCreatedMessage();
    print(account.toString());
    print(account.card.toString());
    return account;
  }

  void _bankInput() {
    stdout.writeln('Digite os três digitos do banco de sua escolha:');
    final bank = stdin.readLineSync();
    if (accountValidations.validateBank(bank)) {
      savingsAccountData['bank'] = bank;
      savingsAccountData['card'] = _createDebitCard();
    } else {
      stdout.writeln('Banco inválido. Tente novamente');
      _bankInput();
    }
  }

  DebitCard _createDebitCard() {
    stdout.writeln('\n**Conta Poupança só tem direito a cartão de débito**');
    return DebitCardInput(userName: user.name).createDebitCard();
  }
}
