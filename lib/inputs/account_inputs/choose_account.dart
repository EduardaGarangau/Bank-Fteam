import 'dart:io';

import 'package:bank_challenge/inputs/account_inputs/savings_account_input.dart';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/models/accounts/account_model.dart';

import '../../models/user_model.dart';
import 'current_accout_input.dart';

class ChooseAccount {
  AccountModel createAccount(UserModel user) {
    InputMessages.createAccountMessage();
    stdout.writeln('1 - Conta Poupança');
    stdout.writeln('2 - Conta Corrente');
    final input = stdin.readLineSync();
    if (input == '1') {
      return SavingsAccountInput(user).createSavingsAccount();
    } else if (input == '2') {
      return CurrentAccountInput(user).createCurrentAccount();
    } else {
      stderr.writeln('Opção inválida. Tente novamente!');
      return createAccount(user);
    }
  }
}
