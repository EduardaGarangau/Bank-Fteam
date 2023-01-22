import 'package:bank_challenge/models/cards/debit_card_model.dart';
import 'package:test/test.dart';

void main() {
  late DebitCard card;

  group('DebitCard Model ', () {
    setUp(() {
      card = DebitCard(userName: 'Eduarda');
    });

    test('should number not be empty when initialize an DebitCard', () {
      expect(card.number.isNotEmpty, true);
    });

    test('should generate number without letters', () {
      bool containsLetters = !card.number.contains(RegExp(r'[A-Za-z]'));
      expect(containsLetters, true);
    });

    test('should generate number with just numbers', () {
      bool containsJustNumbers = card.number.contains(RegExp(r'[0-9]'));
      expect(containsJustNumbers, true);
    });

    test('should generate number with 16 numbers', () {
      expect(card.number.length, equals(16));
    });

    test('should generate flag with the value Visa', () {
      expect(card.flag, equals('Visa'));
    });

    test('should cvv not be empty when initialize an DebitCard', () {
      expect(card.cvv.isNotEmpty, true);
    });

    test('should generate cvv with 3 numbers', () {
      expect(card.cvv.length, equals(3));
    });

    test('should generate cvv without letters', () {
      bool containsLetters = !card.cvv.contains(RegExp(r'[A-Za-z]'));
      expect(containsLetters, true);
    });

    test('should expirationDate not be null when create an DebitCard', () {
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

    test('should return exception when try to access limit', () {
      expect(card.limit, isA<Exception>());
    });

    test('should return exception when try to access amoutSpent', () {
      expect(card.amoutSpent, isA<Exception>());
    });

    test('should throw an exception when use method buyWithCreditCard', () {
      expect(() => card.buyWithCreditCard(100), throwsA(isA<Exception>()));
    });
  });
}
