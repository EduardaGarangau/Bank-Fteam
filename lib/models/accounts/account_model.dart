import 'dart:math';
import '../cards/card_model.dart';
import '../user_model.dart';

abstract class Account {
  final User user;
  final String bank;
  final Card card;
  late String agency;
  late String number;
  double balance;

  Account({
    required this.user,
    required this.bank,
    required this.card,
    this.balance = 0.0,
  }) {
    agency = _generateNumber(5);
    number = _generateNumber(5);
  }

  void transfer(double value) {
    if (balance > 0.0 && value <= balance) {
      balance -= value;
    } else {
      throw Exception('Saldo indisponível para realizar essa operação');
    }
  }

  void deposit(double value) {
    balance += value;
  }

  void withdraw(double value) {
    if (balance > 0.0 && value <= balance) {
      balance -= value;
    } else {
      throw Exception('Saldo indisponível para realizar essa operação');
    }
  }

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
