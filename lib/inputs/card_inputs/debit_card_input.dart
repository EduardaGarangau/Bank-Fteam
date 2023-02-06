import 'dart:io';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/models/cards/debit_card_model.dart';
import 'package:bank_challenge/models/user_model.dart';
import '../../models/cards/card_model.dart';
import '../../validations/card_validations/expiration_date_validation.dart';
import '../../validations/card_validations/flag_validation.dart';

class DebitCardInput {
  final UserModel user;
  late String flag;
  late String expirationDate;

  DebitCardInput(this.user);

  CardModel createDebitCard() {
    InputMessages.createDebitCardMessage();
    _inputFlag();
    _inputExpirationDate();
    return DebitCardModel(
      user: user,
      flag: flag,
      expirationDate: expirationDate,
    );
  }

  void _inputFlag() {
    stdout.writeln('Digite a bandeira do seu novo cartão:');
    final input = stdin.readLineSync();
    final isValid = FlagValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputFlag();
    } else {
      flag = input!;
    }
  }

  void _inputExpirationDate() {
    stdout
        .writeln('Digite a data de validade do seu cartão, sendo de 10 anos:');
    final input = stdin.readLineSync();
    final isValid = ExpirationDateValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputExpirationDate();
    } else {
      expirationDate = input!;
    }
  }
}
