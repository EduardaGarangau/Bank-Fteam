import 'dart:math';
import '../user_model.dart';

enum CardType {
  DebitCard,
  DebitAndCreditCard,
}

abstract class Card {
  final User user;
  final String flag;
  final String expirationDate;
  late String number;
  late String cvv;
  late double limit;
  double amoutSpent;

  Card({
    required this.flag,
    required this.user,
    required this.expirationDate,
    this.amoutSpent = 0.0,
  }) {
    number = _generateNumber(16);
    cvv = _generateNumber(3);
  }

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
