import 'dart:io';
import 'package:bank_challenge/inputs/account_inputs/current_account_input.dart';
import 'package:bank_challenge/inputs/account_inputs/savings_account_input.dart';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/models/user_model.dart';

// class ChooseAccountInput {
//   final User user;

//   ChooseAccountInput({required this.user});

//   void chooseInput() {
//     InputMessages.createAccountMessage();
//     stdout.writeln('1 - Conta Poupança');
//     stdout.writeln('2 - Conta Corrente');
//     final choice = stdin.readLineSync();
//     if (choice == '1') {
//       SavingsAccountInput(user: user).createSavingsAccount();
//     } else if (choice == '2') {
//       CurrentAccountInput(user: user).createCurrentAccount();
//     } else {
//       stderr.writeln('Opção inválida! Tente novamente.');
//       chooseInput();
//     }
//   }
// }
