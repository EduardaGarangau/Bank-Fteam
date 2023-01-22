import 'dart:js_util';

import 'package:bank_challenge/models/accounts/savings_acount_model.dart';
import 'package:bank_challenge/models/address_model.dart';
import 'package:bank_challenge/models/cards/debit_and_credit_card_model.dart';
import 'package:bank_challenge/models/cards/debit_card_model.dart';
import 'package:bank_challenge/models/user_model.dart';
import 'package:test/test.dart';

void main() {
  late User user;
  late SavingsAccount account;

  group('SavingsAccount Model', () {
    setUp(() {
      user = user = User(
        name: 'Eduarda',
        email: 'eduardagarangau98@gmail.com',
        phone: '41996717016',
        password: '12345678',
        cpf: '08591413903',
        address: Address(
          street: 'Rua José Mario de Oliveira',
          cep: '82520550',
          city: 'Curitiba',
          district: 'Bacacheri',
          number: '216',
          state: 'Paraná',
          complement: 'Sobrado 3',
        ),
      );

      account = SavingsAccount(
        user: user,
        bank: 'Banco do Brasil',
        balance: 4000,
      );
    });

    test('agency should not be empty when instantiate an SavingsAccount', () {
      expect(account.agency.isNotEmpty, equals(true));
    });

    test('should auto generate agency without letters', () {
      bool notContainsLetters = !account.agency.contains(RegExp(r'[A-Za-z]'));
      expect(notContainsLetters, equals(true));
    });

    test('should auto generate agency with just numbers', () {
      bool containsJustNumbers = account.agency.contains(RegExp(r'[0-9]'));
      expect(containsJustNumbers, equals(true));
    });

    test('should auto generate agency with 5 numbers', () {
      expect(account.agency.length, equals(5));
    });

    test('number should not be empty when instantiate an SavingsAccount', () {
      expect(account.number.isNotEmpty, equals(true));
    });

    test('should auto generate number without letters', () {
      bool notContainsLetters = !account.number.contains(RegExp(r'[A-Za-z]'));
      expect(notContainsLetters, equals(true));
    });

    test('should auto generate number with just numbers', () {
      bool containsJustNumbers = account.number.contains(RegExp(r'[0-9]'));
      expect(containsJustNumbers, equals(true));
    });

    test('should auto generate number with 5 numbers ', () {
      expect(account.number.length, equals(5));
    });

    test('card should be DebitCard when instantiate an SavingsAccount', () {
      expect(account.card.runtimeType, equals(DebitCard));
    });

    test(
        'card should not be DebitAndCreditCard when instantiate an SavingsAccount',
        () {
      expect(account.card.runtimeType, isNot(equals(DebitAndCreditCard)));
    });

    test(
        'balance should decrease when user make a transfer of smaller value than balance',
        () {
      account.transfer(1000);
      expect(account.balance, equals(3000));
    });

    test(
        'balance should keep decreasing while user make new transfers that not exceeds the balance',
        () {
      account.transfer(1000);
      account.transfer(3000);
      expect(account.balance, equals(0.0));
    });

    test(
        'should throw an Exception when user try to make an transfer of value greater than balance',
        () {
      expect(() => account.transfer(4500), throwsA(isA<Exception>()));
    });

    test(
        'should throw an Exception while user make new transfers that exceeds the balance',
        () {
      account.transfer(500);
      account.transfer(3500);
      expect(() => account.transfer(100), throwsA(isA<Exception>()));
    });

    test('balance should increase when user make a deposit', () {
      account.deposit(1000.50);
      expect(account.balance, equals(5000.50));
    });

    test(
        'balance should decrease when user make a withdraw of smaller value than balance',
        () {
      account.withdraw(500.42);
      expect(account.balance, equals(3499.58));
    });

    test(
        'balance should keep decreasing while user make new withdraws of smaller value than balance',
        () {
      account.withdraw(2500.50);
      account.withdraw(1499.50);
      expect(account.balance, equals(0.0));
    });

    test(
        'should throw an Exception when user try to make an withdraw of value greater than balance',
        () {
      expect(() => account.withdraw(4001.50), throwsA(isA<Exception>()));
    });

    test(
        'should throw an Exception while user make new withdraws that exceeds the balance',
        () {
      account.withdraw(2000);
      account.withdraw(2000);
      expect(() => account.transfer(50), throwsA(isA<Exception>()));
    });
  });
}
