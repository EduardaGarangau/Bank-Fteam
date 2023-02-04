import 'dart:io';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/inputs/menu_inputs/menu_input.dart';

class SavingsAccountMenuInput extends MenuInput {
  SavingsAccountMenuInput(super.account);

  @override
  void startMenu() {
    InputMessages.savingsAccountMenuTitle();
    stdout.writeln('Escolha uma opção:');
    stdout.writeln('1 - Depositar');
    stdout.writeln('2 - Sacar');
    stdout.writeln('3 - Simular Rendimento de Poupança');
    stdout.writeln('4 - Pagar com Cartão de Débito');
    stdout.writeln('5 - Detalhes do Usuário');
    stdout.writeln('6 - Detalhes da Conta');
    stdout.writeln('7 - Detalhes do Cartão');
    final input = stdin.readLineSync();

    switch (input) {
      case '1':
        super.inputDeposit();
        break;
      case '2':
        super.inputWithdraw();
        break;
      case '3':
        super.renderBalance();
        break;
      case '4':
        super.inputPayWithDebitCard();
        break;
      case '5':
        super.showUserDetails();
        break;
      case '6':
        super.showAccountDetails();
        break;
      case '7':
        super.showCardDetails();
        break;
      default:
        startMenu();
        break;
    }
  }
}
