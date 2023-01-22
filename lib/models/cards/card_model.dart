import 'dart:math';

enum CardType {
  debit,
  debitAndCredit,
}

abstract class Card {
  final String userName;
  late String flag;
  late String number;
  late String cvv;
  late DateTime expirationDate;
  dynamic limit;
  dynamic amoutSpent;

  Card({
    required this.userName,
  }) {
    flag = 'Visa';
    number = _generateNumber(16);
    cvv = _generateNumber(3);
    expirationDate = _generateExpirationDate();
  }

  void buyWithCreditCard(double value);

  String _generateNumber(int numberLength) {
    String randomNumber = '';
    var random = Random();
    var randomNumbers =
        List<int>.generate(numberLength, (index) => random.nextInt(9));

    for (var number in randomNumbers) {
      randomNumber = randomNumber + number.toString();
    }
    return randomNumber;
  }

  DateTime _generateExpirationDate() {
    final actualMonth = DateTime.now().month;
    final actualYear = DateTime.now().year;
    return DateTime(actualYear + 2, actualMonth, 28);
  }
}
