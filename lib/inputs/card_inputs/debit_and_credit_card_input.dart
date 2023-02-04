import 'dart:io';
import 'package:bank_challenge/models/cards/card_model.dart';
import 'package:bank_challenge/models/cards/debit_and_credit_card_model.dart';
import 'package:bank_challenge/models/user_model.dart';
import '../../validations/card_validations/expiration_date_validation.dart';
import '../../validations/card_validations/flag_validation.dart';
import '../input_messages.dart';

class DebitAndCreditCardInput {
  final User user;
  late String flag;
  late String expirationDate;

  DebitAndCreditCardInput(this.user);

  Card createDebitAndCreditCard() {
    InputMessages.createDebitAndCreditCardMessage();
    inputFlag();
    return DebitAndCreditCard(
      user: user,
      flag: flag,
      expirationDate: expirationDate,
    );
  }

  void inputFlag() {
    stdout.writeln('Digite a bandeira do seu novo cartão:');
    final input = stdin.readLineSync();
    final isValid = FlagValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputFlag();
    } else {
      flag = input!;
      inputExpirationDate();
    }
  }

  void inputExpirationDate() {
    stdout
        .writeln('Digite a data de validade do seu cartão, sendo de 10 anos:');
    final input = stdin.readLineSync();
    final isValid = ExpirationDateValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputExpirationDate();
    } else {
      expirationDate = input!;
    }
  }
}
