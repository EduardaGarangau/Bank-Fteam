import 'dart:io';
import 'package:bank_challenge/models/cards/debit_and_credit_card_model.dart';
import 'package:bank_challenge/models/user_model.dart';
import '../../validations/card_validations.dart';

class DebitAndCreditCardInput {
  final User user;
  final cardValidations = CardValidations();
  Map<String, dynamic> cardData = {};

  DebitAndCreditCardInput({required this.user});

  DebitAndCreditCard createDebitAndCreditCard() {
    stdout.writeln('--CARTÃO DE DÉBITO E CRÉDITO--');
    _inputFlag();
    return DebitAndCreditCard(
      user: user,
      flag: cardData['flag'],
      expirationDate: cardData['expirationDate'],
      userMontlyIncome: user.monthlyIncome!,
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
