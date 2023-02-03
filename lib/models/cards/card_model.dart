import 'dart:math';
import 'package:bank_challenge/value_objects/card_vo/expiration_date_vo.dart';
import 'package:bank_challenge/value_objects/card_vo/flag_vo.dart';

import '../user_model.dart';

enum CardType {
  DebitCard,
  DebitAndCreditCard,
}

abstract class Card {
  final User user;
  FlagVO _flag;
  ExpirationDateVO _expirationDate;
  late String number = _generateNumber(16);
  late String cvv = _generateNumber(3);
  late double limit;
  double amoutSpent;

  FlagVO get flag => _flag;
  void setFlag(String value) => _flag = FlagVO(value);

  ExpirationDateVO get expirationDate => _expirationDate;
  void setExpirationDate(String value) =>
      _expirationDate = ExpirationDateVO(value);

  Card({
    required this.user,
    required expirationDate,
    required flag,
    this.amoutSpent = 0.0,
  })  : _flag = FlagVO(flag),
        _expirationDate = ExpirationDateVO(expirationDate);

  double buyWithDebit(double value, double balance);

  void buyWithCredit(double value);

  String _generateNumber(int numberLength) {
    String randomNumber = '';
    var randomNumbers = _generateRandomNumbers(numberLength);

    for (var number in randomNumbers) {
      randomNumber = randomNumber + number.toString();
    }
    return randomNumber;
  }

  List<int> _generateRandomNumbers(int numberLength) {
    var randomNumber = Random();
    return List<int>.generate(numberLength, (index) => randomNumber.nextInt(9));
  }
}
