import 'package:bank_challenge/models/cards/debit_and_credit_card_model.dart';
import 'package:test/test.dart';

void main() {
  late DebitAndCreditCard card;

  group('DebitAndCreditCard Model ', () {
    setUp(() {
      card = DebitAndCreditCard(userName: 'Eduarda', creditLimit: 400);
    });

    test('should number not be empty when create an DebitAndCreditCard', () {
      expect(card.number.isNotEmpty, true);
    });

    test('should generate number with 16 numbers', () {
      expect(card.number.length, equals(16));
    });

    test('should generate number without letters', () {
      bool containsLetters = !card.number.contains(RegExp(r'[A-Za-z]'));
      expect(containsLetters, true);
    });

    test('should generate Visa flag', () {
      expect(card.flag, equals('Visa'));
    });

    test('should cvv not be empty when create an DebitAndCreditCard', () {
      expect(card.cvv.isNotEmpty, true);
    });

    test('should generate cvv with 3 numbers', () {
      expect(card.cvv.length, equals(3));
    });

    test('should generate cvv without letters', () {
      bool containsLetters = !card.cvv.contains(RegExp(r'[A-Za-z]'));
      expect(containsLetters, true);
    });

    test('should expirationDate not be null when create an DebitAndCreditCard',
        () {
      expect(card.expirationDate, isNotNull);
    });

    test('should generate expirationDate with two years more', () {
      int expectExpirationYear = DateTime.now().year + 2;
      expect(card.expirationDate.year, equals(expectExpirationYear));
    });

    test('should generate expirationDate with same month it was created', () {
      int actualMonth = DateTime.now().month;
      expect(card.expirationDate.month, equals(actualMonth));
    });

    test('should generate expirationDate with day 28', () {
      expect(card.expirationDate.day, equals(28));
    });

    test('should return limit when DebitAndCreditCard was created', () {
      expect(card.limit, equals(400));
    });

    test('should return default amoutSpent when DebitAndCreditCard was created',
        () {
      expect(card.amoutSpent, equals(0.0));
    });

    test('should limit equals 300 when use method buyWithCreditCard', () {
      card.buyWithCreditCard(50);
      card.buyWithCreditCard(50);
      expect(card.limit, equals(300));
    });

    test('should amoutSpent equals 200 when use method buyWithCreditCard', () {
      card.buyWithCreditCard(100);
      card.buyWithCreditCard(100);
      expect(card.amoutSpent, equals(200));
    });

    test('should throw Exception when exceed the limit', () {
      expect(() => card.buyWithCreditCard(401), throwsA(isA<Exception>()));
    });
  });
}
