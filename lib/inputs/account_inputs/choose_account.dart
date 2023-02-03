import 'dart:io';

import 'package:bank_challenge/inputs/input_messages.dart';

import '../../models/user_model.dart';

class ChooseAccount {
  void createAccount(User user) {
    InputMessages.createAccountMessage();
    stdout.writeln('1 - Conta Poupança');
    stdout.writeln('2 - Conta Corrente');
    final input = stdin.readLineSync();
  }
}
