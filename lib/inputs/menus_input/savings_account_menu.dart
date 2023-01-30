import 'dart:io';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/inputs/menus_input/account_menu_input.dart';

class SavingsAccountMenuInput extends AccountMenuInput {
  SavingsAccountMenuInput({required super.account});

  @override
  void startMenu() {
    InputMessages.savingsAccountMenuTitle();
    stdout.writeln('Escolha uma opção do menu:');
    stdout.writeln('1 - Verificar saldo atual');
    stdout.writeln('2 - Sacar');
    stdout.writeln('3 - Depositar');
    stdout.writeln('4 - Simular Rendimento de Poupança');
    stdout.writeln('5 - Pagar com Cartão de Débito');
    stdout.writeln('6 - Exibir Dados Pessoais');
    stdout.writeln('7 - Exibir dados da Conta e Cartão');
    final option = stdin.readLineSync();

    if (option == '1') {
      super.verifyAccountBalance();
    } else if (option == '2') {
      super.inputWithdraw();
    } else if (option == '3') {
      super.inputDeposit();
    } else if (option == '4') {
      _inputRenderDays();
    } else if (option == '5') {
      super.payWithDebitCard();
    } else if (option == '6') {
      super.showUserDetails();
    } else if (option == '7') {
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
