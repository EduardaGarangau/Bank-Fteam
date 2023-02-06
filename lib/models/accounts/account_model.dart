import 'dart:math';
import 'package:bank_challenge/models/cards/card_model.dart';

import '../cards/debit_card_model.dart';
import '../user_model.dart';

abstract class AccountModel {
  final UserModel user;
  final String bank;
  late CardModel card;
  double balance;
  String agency;
  String number;

  AccountModel({
    required this.user,
    required this.bank,
  })  : balance = 0.0,
        agency = _generateNumber(5),
        number = _generateNumber(5);

  @override
  String toString() {
    return 'Numero da Conta: $number\nAgencia: $agency\nBanco: $bank\nSaldo: $balance';
  }

  bool get cardIsDebit => card is DebitCardModel;

  bool get montlyIncomeIsNull => user.montlyIncome == null;

  String? deposit(double value) {
    if (value > 0 && value <= 5000) {
      balance += value;
      return null;
    } else {
      return 'Valor inválido. Só é possível depositar até 5000 reais. Operação cancelada!';
    }
  }

  String? withdraw(double value) {
    if (value > 0 && value <= balance) {
      balance -= value;
      return null;
    } else {
      return 'Valor excedeu seu saldo de $balance reais. Operação cancelada!';
    }
  }

  String? loan(double value) {
    final seventyPerCent = user.montlyIncome! * 0.7;
    final twentyPerCent = user.montlyIncome! * 0.2;

    if (value >= twentyPerCent && value <= seventyPerCent) {
      balance += value;
      return null;
    } else {
      return 'Valor inválido. Você só pode fazer um empréstimo de $twentyPerCent a $seventyPerCent!';
    }
  }

  void renderBalance(int value) {
    final days = value;
    final halfDays = days / 2;
    final doubleDays = days * 2;
    final totalDayRender = balance * 0.02;
    final totalInDays = totalDayRender * days;
    final totalInHalfDays = totalDayRender * halfDays;
    final totalInDoubleDays = totalDayRender * doubleDays;
    print('Em $days dias seu dinheiro renderá: $totalInDays');
    print('Em $halfDays dias seu dinheiro renderá: $totalInHalfDays');
    print('Em $doubleDays dias seu dinheiro renderá: $totalInDoubleDays');
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
