import 'dart:math';
import '../user_model.dart';

abstract class CardModel {
  final UserModel user;
  final String flag;
  final String expirationDate;
  String number;
  String cvv;
  double limit;
  double amountSpend;

  CardModel({
    required this.user,
    required this.flag,
    required this.expirationDate,
  })  : number = _generateNumber(16),
        cvv = _generateNumber(3),
        limit = 0.0,
        amountSpend = 0.0;

  @override
  String toString() {
    return 'Nome: ${user.name}\nNúmero: $number\nCVV: $cvv\nBandeira: $flag\nData de Validade: $expirationDate';
  }

  double? buyWithDebit(double value, double accountBalance) {
    if (value > 0 && value <= accountBalance) {
      accountBalance -= value;
      return accountBalance;
    } else {
      return null;
    }
  }

  String? buyWithCreditCard(double value) {
    if (value <= limit) {
      amountSpend += value;
      limit -= value;
      return null;
    } else {
      return 'O valor excedeu o limite do cartão de crédito de $limit';
    }
  }

  static String _generateNumber(int numberLength) {
    String randomNumber = '';
    var randomNumbers = _generateRandomNumbers(numberLength);

    for (var number in randomNumbers) {
      randomNumber = randomNumber + number.toString();
    }
    return randomNumber;
  }

  static List<int> _generateRandomNumbers(int numberLength) {
    var randomNumber = Random();
    return List<int>.generate(numberLength, (index) => randomNumber.nextInt(9));
  }
}
