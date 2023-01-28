import 'package:bank_challenge/models/cards/debit_and_credit_card_model.dart';
import 'package:test/test.dart';

void main() {
  late DebitAndCreditCard card;

  group('DebitAndCreditCardModel:', () {
    setUp(() {
      card = DebitAndCreditCard(
        userName: 'Eduarda Garangau',
        flag: 'Visa',
        expirationDate: '01/01/2033',
        userMontlyIncome: 5000,
      );
    });

    test('the name of the card should be the same name of the User', () {
      expect(card.userName, equals('Eduarda'));
    });

    test('card flag should not be null when create an DebitCard', () {
      expect(card.flag, isNotNull);
    });

    test('should auto generate card flag with the value Visa', () {
      expect(card.flag, equals('Visa'));
    });

    test('should card number not be empty when create an DebitAndCreditCard',
        () {
      expect(card.number.isNotEmpty, true);
    });

    test('should generate card number without letters', () {
      bool containsLetters = !card.number.contains(RegExp(r'[A-Za-z]'));
      expect(containsLetters, true);
    });

    test('should generate card number with just numbers', () {
      bool containsJustNumbers = card.number.contains(RegExp(r'[0-9]'));
      expect(containsJustNumbers, true);
    });

    test('should generate card number with 16 numbers', () {
      expect(card.number.length, equals(16));
    });

    test('should card cvv not be empty when create an DebitAndCreditCard', () {
      expect(card.cvv.isNotEmpty, true);
    });

    test('should generate card cvv without letters', () {
      bool containsLetters = !card.cvv.contains(RegExp(r'[A-Za-z]'));
      expect(containsLetters, true);
    });

    test('should generate card cvv with just numbers', () {
      bool containsJustNumbers = card.cvv.contains(RegExp(r'[0-9]'));
      expect(containsJustNumbers, true);
    });

    test('should generate card cvv with 3 numbers', () {
      expect(card.cvv.length, equals(3));
    });

    test('should expirationDate not be null when create an DebitAndCreditCard',
        () {
      expect(card.expirationDate, isNotNull);
    });

    test('should return the limit when create an DebitAndCreditCard', () {
      expect(card.limit, equals(400));
    });

    test('should return default amoutSpent when create an DebitAndCreditCard',
        () {
      expect(card.amoutSpent, equals(0.0));
    });

    test('should limit decrease when User buy with DebitAndCreditCard', () {
      card.buyWithCreditCard(50);
      card.buyWithCreditCard(50);
      expect(card.limit, equals(300));
    });

    test('should amoutSpent increase when User buy with DebitAndCreditCard',
        () {
      card.buyWithCreditCard(100);
      card.buyWithCreditCard(100);
      expect(card.amoutSpent, equals(200));
    });

    test(
        'should throw an Exception when User exceeds the limit of DebitAndCreditCard',
        () {
      card.buyWithCreditCard(300);
      expect(() => card.buyWithCreditCard(150), throwsA(isA<Exception>()));
    });
  });
}
