import 'dart:io';
import 'package:bank_challenge/inputs/card_inputs/debit_and_credit_card_input.dart';
import 'package:bank_challenge/models/accounts/current_acount_model.dart';
import 'package:bank_challenge/validations/account_validations/bank_validation.dart';
import '../../models/cards/card_model.dart';
import '../../models/user_model.dart';
import '../card_inputs/debit_card_input.dart';
import '../input_messages.dart';

class CurrentAccountInput {
  final UserModel user;
  late String bank;
  late CardModel card;

  CurrentAccountInput(this.user);

  CurrentAccountModel createCurrentAccount() {
    InputMessages.currentAccountTitleMessage();
    _inputBank();
    final account = CurrentAccountModel(
      user: user,
      bank: bank,
      card: card,
    );
    InputMessages.currentAccountCreatedMessage();
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

      if (user.montlyIncome == null) {
        card = DebitCardInput(user).createDebitCard();
      } else {
        _chooseCard();
      }
    }
  }

  void _chooseCard() {
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
      _chooseCard();
    }
  }
}
