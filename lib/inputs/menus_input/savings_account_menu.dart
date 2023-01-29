import 'dart:io';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/inputs/menus_input/iaccount_menu.dart';

class SavingsAccountMenuInput extends IAccountMenuInput {
  SavingsAccountMenuInput({required super.account});

  @override
  void startMenu() {
    InputMessages.savingsAccountMenuTitle();
    stdout.writeln('Escolha uma opção do menu:');
    stdout.writeln('1 - Sacar');
    stdout.writeln('2 - Depositar');
    stdout.writeln('3 - Simular Rendimento de Poupança');
    stdout.writeln('4 - Pagar com cartão de débito');
    stdout.writeln('5 - Exibir Dados Pessoais');
    stdout.writeln('6 - Exibir dados da Conta e Cartão');
    final option = stdin.readLineSync();

    if (option == '1') {
      super.inputWithdraw();
    } else if (option == '2') {
      super.inputDeposit();
    } else if (option == '3') {
      _inputRenderDays();
    } else if (option == '4') {
      super.payWithDebitCard();
    } else if (option == '5') {
      super.showUserDetails();
    } else if (option == '6') {
      super.showAccountDetails();
    } else {
      stderr.writeln('Opção inválida! Tente Novamente');
      startMenu();
    }
  }

  void _inputRenderDays() {
    stdout.writeln(
        'Digite quantos dias gostaria para simular o rendimento da sua conta poupança:');
    final daysString = stdin.readLineSync();
    final days = int.tryParse(daysString!);

    if (accountValidations.validateRenderBalance(daysString)) {
      if (super.requiredPassword()) {
        stdout.writeln('Operação efetuada com sucesso!');
        account.renderBalance(days!);
        super.comeBackToMenu();
      } else {
        startMenu();
      }
    } else {
      stderr.writeln('Valor de dias inválido! Tente novamente');
      _inputRenderDays();
    }
  }
}
