import 'dart:io';

import 'package:bank_challenge/inputs/account_inputs/savings_account_input.dart';
import 'package:bank_challenge/inputs/input_messages.dart';

import '../../models/user_model.dart';
import 'current_accout_input.dart';

class ChooseAccount {
  void createAccount(UserModel user) {
    InputMessages.createAccountMessage();
    stdout.writeln('1 - Conta Poupança');
    stdout.writeln('2 - Conta Corrente');
    final input = stdin.readLineSync();
    if (input == '1') {
      SavingsAccountInput(user).createSavingsAccount();
    } else if (input == '2') {
      CurrentAccountInput(user).createCurrentAccount();
    } else {
      stderr.writeln('Opção inválida. Tente novamente!');
      createAccount(user);
    }
  }
}
