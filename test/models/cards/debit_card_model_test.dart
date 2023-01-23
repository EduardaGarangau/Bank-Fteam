import 'package:bank_challenge/models/cards/debit_card_model.dart';
import 'package:test/test.dart';

void main() {
  late DebitCard card;

  group('DebitCardModel:', () {
    setUp(() {
      card = DebitCard(userName: 'Eduarda');
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

    test('should card number not be empty when create an DebitCard', () {
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

    test('should card cvv not be empty when create an DebitCard', () {
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

    test('should card expirationDate not be null when create an DebitCard', () {
      expect(card.expirationDate, isNotNull);
    });

    test('should generate card expirationDate with two years more', () {
      int expectExpirationYear = DateTime.now().year + 2;
      expect(card.expirationDate.year, equals(expectExpirationYear));
    });

    test('should generate card expirationDate with same month it was created',
        () {
      int actualMonth = DateTime.now().month;
      expect(card.expirationDate.month, equals(actualMonth));
    });

    test('should generate card expirationDate with day 28', () {
      expect(card.expirationDate.day, equals(28));
    });

    test('should return an Exception when try to access card limit', () {
      expect(card.limit, isA<Exception>());
    });

    test('should return an Exception when try to access amoutSpent', () {
      expect(card.amoutSpent, isA<Exception>());
    });

    test('should throw an Exception when use method buyWithCreditCard', () {
      expect(() => card.buyWithCreditCard(100), throwsA(isA<Exception>()));
    });
  });
}
