import 'dart:io';
import 'package:bank_challenge/inputs/account_inputs/current_account_input.dart';
import 'package:bank_challenge/inputs/account_inputs/savings_account_input.dart';
import 'package:bank_challenge/models/user_model.dart';

class ChooseAccountInput {
  void chooseInput(User user) {
    stdout.writeln('\n\n--ESCOLHA UMA CONTA--');
    stdout.writeln('1 - Conta Poupança');
    stdout.writeln('2 - Conta Corrente');
    final choice = stdin.readLineSync();
    if (choice == '1') {
      SavingsAccountInput(user: user).createSavingsAccount();
    } else if (choice == '2') {
      CurrentAccountInput(user: user).createCurrentAccount();
    } else {
      stdout.writeln('Opção inválida! Tente novamente.');
      chooseInput(user);
    }
  }
}
