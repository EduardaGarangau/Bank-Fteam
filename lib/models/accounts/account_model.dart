import 'dart:math';
import '../cards/card_model.dart';
import '../user_model.dart';

abstract class Account {
  final User user;
  final Card card;
  final String bank;
  late String agency;
  late String number;
  double balance;
  CardType? cardType;

  Account({
    required this.user,
    required this.bank,
    required this.card,
    this.balance = 0.0,
    this.cardType,
  }) {
    agency = _generateNumber(5);
    number = _generateNumber(5);
  }

  void deposit(double value) {
    balance += value;
  }

  void withdraw(double value) {
    balance -= value;
  }

  void applyForLoan(double value);

  void renderBalance(int days);

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
