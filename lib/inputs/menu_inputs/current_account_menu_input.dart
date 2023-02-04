import 'dart:io';

import 'package:bank_challenge/inputs/menu_inputs/menu_input.dart';

import '../input_messages.dart';

class CurrentAccountMenuInput extends MenuInput {
  CurrentAccountMenuInput(super.account);

  @override
  void startMenu() {
    InputMessages.currentAccountMenuTitle();
    stdout.writeln('Escolha uma opção:');
    stdout.writeln('1 - Depositar');
    stdout.writeln('2 - Sacar');
    stdout.writeln('3 - Realizar Empréstimo');
    stdout.writeln('4 - Pagar com Cartão de Débito');
    stdout.writeln('5 - Pagar com Cartão de Crédito');
    stdout.writeln('6 - Detalhes do Usuário');
    stdout.writeln('7 - Detalhes da Conta');
    stdout.writeln('8 - Detalhes do Cartão');
    final input = stdin.readLineSync();

    switch (input) {
      case '1':
        super.inputDeposit();
        break;
      case '2':
        super.inputWithdraw();
        break;
      case '3':
        acceptApplyForLoan();
        break;
      case '4':
        super.inputPayWithDebitCard();
        break;
      case '5':
        acceptPayWithCreditCard();
        break;
      case '6':
        super.showUserDetails();
        break;
      case '7':
        super.showAccountDetails();
        break;
      case '8':
        super.showCardDetails();
        break;
      default:
        startMenu();
        break;
    }
  }

  void acceptApplyForLoan() {
    if (account.montlyIncomeIsNull) {
      stdout.writeln('Empréstimo indisponível. Renda mensal não foi fornecida');
      comeBackToMenu();
    } else {
      inputApplyForLoan();
    }
  }

  void acceptPayWithCreditCard() {
    if (account.cardIsDebit) {
      stdout.writeln('Cartão de Crédito indisponível.');
      comeBackToMenu();
    } else {
      super.inputPayWithCreditCard();
    }
  }
}
