import 'dart:io';

import 'package:bank_challenge/models/cards/debit_card_model.dart';
import 'package:bank_challenge/validations/card_validations.dart';

class DebitCardInput {
  final cardValidations = CardValidations();
  final String userName;
  Map<String, dynamic> cardData = {};

  DebitCardInput({required this.userName});

  DebitCard createDebitCard() {
    stdout.writeln('--CARTÃO DE DÉBITO--');
    _inputFlag();
    return DebitCard(
      userName: userName,
      flag: cardData['flag'],
      expirationDate: cardData['expirationDate'],
    );
  }

  void _inputFlag() {
    stdout.writeln('Digite a bandeira do seu novo cartão:');
    final flag = stdin.readLineSync();
    if (cardValidations.validateFlag(flag)) {
      cardData['flag'] = flag;
      _inputExpirationDate();
    } else {
      stdout.writeln('Bandeira inválida. Tente Novamente!');
      _inputFlag();
    }
  }

  void _inputExpirationDate() {
    stdout.writeln(
        'Digite a validade do seu novo cartão sendo 10 anos a mais que o ano atual:');
    final expirationDate = stdin.readLineSync();
    if (cardValidations.validateExpirationDate(expirationDate)) {
      cardData['expirationDate'] = expirationDate;
    } else {
      stdout.writeln('Data de Validade inválida. Tente Novamente!');
      _inputExpirationDate();
    }
  }
}
