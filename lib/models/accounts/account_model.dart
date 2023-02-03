import 'dart:math';
import 'package:bank_challenge/models/accounts/savings_acount_model.dart';
import 'package:bank_challenge/value_objects/account_vo/bank_vo.dart';
import 'package:bank_challenge/value_objects/account_vo/deposit_value_vo.dart';
import 'package:bank_challenge/value_objects/account_vo/render_value_vo.dart';
import 'package:bank_challenge/value_objects/account_vo/withdraw_value_vo.dart';
import '../../value_objects/account_vo/applyLoan_value_vo.dart';
import '../cards/card_model.dart';
import '../user_model.dart';

abstract class Account {
  final User user;
  BankVO _bank;
  double _balance;
  late String agency = _generateNumber(5);
  late String number = _generateNumber(5);
  CardType? cardType;

  BankVO get bank => _bank;
  void setBank(String value) => _bank = BankVO(value);

  double get balance => _balance;
  void setBalance(double value) => _balance = value;

  Account({
    required this.user,
    required bank,
    this.cardType,
  })  : _bank = BankVO(bank),
        _balance = 0.0;

  String? deposit(String input) {
    final depositValue = DepositValueVO(double.tryParse(input));
    final isValid = depositValue.validate();
    if (isValid != null) {
      return isValid;
    } else {
      _balance += depositValue.value!;
      setBalance(_balance);
      return null;
    }
  }

  String? withdraw(String input) {
    final withdrawValue = WithdrawValueVO(balance, double.tryParse(input));
    final isValid = withdrawValue.validate();
    if (isValid != null) {
      return isValid;
    } else {
      _balance -= withdrawValue.value!;
      setBalance(_balance);
      return null;
    }
  }

  String? applyForLoan(String input) {
    if (user.montlyIncome.value != null) {
      final loanValue =
          ApplyLoanValueVO(user.montlyIncome.value, double.tryParse(input));
      final isValid = loanValue.validate();
      if (isValid != null) {
        return isValid;
      } else {
        _balance += loanValue.value!;
        setBalance(_balance);
        return null;
      }
    } else {
      return 'Emprestimo indisponível. Renda mensal não fornecida!';
    }
  }

  String? renderBalance(String input) {
    final days = int.tryParse(input);
    final renderValue = RenderValueVO(days);
    final isValid = renderValue.validate();
    if (isValid != null) {
      return isValid;
    } else {
      final halfDays = days! / 2;
      final doubleDays = days * 2;
      final totalInDays = (_balance * 0.02) * days;
      final totalInHalfDays = (_balance * 0.02) * halfDays;
      final totalInDoubleDays = (_balance * 0.02) * doubleDays;
      print('Em $days dias seu dinheiro renderá: $totalInDays');
      print('Em $halfDays dias seu dinheiro renderá: $totalInHalfDays');
      print('Em $doubleDays dias seu dinheiro renderá: $totalInDoubleDays');
      return null;
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
