import 'dart:io';
import 'package:bank_challenge/inputs/cards_input/debit_and_credit_input.dart';
import 'package:bank_challenge/inputs/menus_input/current_account_menu.dart';
import 'package:bank_challenge/models/accounts/current_acount_model.dart';
import 'package:bank_challenge/models/cards/card_model.dart';
import 'package:bank_challenge/models/cards/debit_and_credit_card_model.dart';
import '../../models/cards/debit_card_model.dart';
import '../../models/user_model.dart';
import '../../validations/account_validations.dart';
import '../cards_input/debit_card_input.dart';
import '../input_messages.dart';

class CurrentAccountInput {
  final User user;
  final accountValidations = AccountValidations();
  Map<String, dynamic> currentAccountData = {};

  CurrentAccountInput({required this.user});

  void createCurrentAccount() {
    stdout.writeln('\n--CONTA CORRENTE--');
    _bankInput();
    final account = CurrentAccount(
      user: user,
      bank: currentAccountData['bank'],
      card: currentAccountData['card'],
      cardType: currentAccountData['cardType'],
    );
    InputMessages.currentAccountCreatedMessage();
    CurrentAccountMenuInput(account: account).startMenu();
  }

  void _bankInput() {
    stdout.writeln('Digite os três digitos do banco de sua escolha:');
    final bank = stdin.readLineSync();
    if (accountValidations.validateBank(bank)) {
      currentAccountData['bank'] = bank;
      user.monthlyIncome != null ? _chooseCard() : _createDebitCard();
    } else {
      stdout.writeln('Banco inválido. Tente novamente');
      _bankInput();
    }
  }

  void _chooseCard() {
    stdout.writeln('\n\n--ESCOLHA UM CARTÃO--');
    stdout.writeln('1 - Cartão de Débito');
    stdout.writeln('2 - Cartão de Débito e Crédito');
    final choice = stdin.readLineSync();
    if (choice == '1') {
      currentAccountData['card'] = _createDebitCard();
    } else if (choice == '2') {
      currentAccountData['card'] = _createDebitAndCreditCard();
    } else {
      stdout.writeln('Opção inválida! Tente novamente.');
      _chooseCard();
    }
  }

  DebitCard _createDebitCard() {
    currentAccountData['cardType'] = CardType.DebitCard;
    user.monthlyIncome ??
        stdout.writeln(
            '\n**Você só tem direito a cartão de débito porque não forneceu sua renda mensal**');
    return DebitCardInput(user: user).createDebitCard();
  }

  DebitAndCreditCard _createDebitAndCreditCard() {
    currentAccountData['cardType'] = CardType.DebitAndCreditCard;
    return DebitAndCreditCardInput(user: user).createDebitAndCreditCard();
  }
}
