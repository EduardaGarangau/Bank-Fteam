import 'dart:io';
import '../../models/user_model.dart';
import '../../validations/card_validations.dart';

abstract class CardInput {
  final User user;
  final cardValidations = CardValidations();
  Map<String, dynamic> cardData = {};

  CardInput({required this.user});

  void inputFlag() {
    stdout.writeln('Digite a bandeira do seu novo cartão:');
    final flag = stdin.readLineSync();
    if (cardValidations.validateFlag(flag)) {
      cardData['flag'] = flag;
      inputExpirationDate();
    } else {
      stdout.writeln('Bandeira inválida. Tente Novamente!');
      inputFlag();
    }
  }

  void inputExpirationDate() {
    stdout.writeln(
        'Digite a validade do seu novo cartão sendo 10 anos a mais que o ano atual:');
    final expirationDate = stdin.readLineSync();
    if (cardValidations.validateExpirationDate(expirationDate)) {
      cardData['expirationDate'] = expirationDate;
    } else {
      stdout.writeln('Data de Validade inválida. Tente Novamente!');
      inputExpirationDate();
    }
  }
}
