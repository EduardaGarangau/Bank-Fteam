import 'package:bank_challenge/validations/card_validations.dart';
import 'package:test/test.dart';

void main() {
  late CardValidations cardValidations;

  group('Validate Card expirationDate:', () {
    setUp(() {
      cardValidations = CardValidations();
    });

    test(
        'should return false if day, month and year is the same of actual date',
        () {
      final isValid = cardValidations.validateExpirationDate('27/01/2023');
      expect(isValid, equals(false));
    });

    test('should return false if the day is less than actual day', () {
      final isValid = cardValidations.validateExpirationDate('25/01/2023');
      expect(isValid, equals(false));
    });

    test('should return true if the day is more than actual day', () {
      final isValid = cardValidations.validateExpirationDate('30/01/2023');
      expect(isValid, equals(true));
    });

    test(
        'should return true if month is more than actual month, but same day and year',
        () {
      final isValid = cardValidations.validateExpirationDate('27/02/2023');
      expect(isValid, equals(true));
    });

    test(
        'should return true if month is more than actual month, and day is less than actual day',
        () {
      final isValid = cardValidations.validateExpirationDate('01/02/2023');
      expect(isValid, equals(true));
    });

    test(
        'should return true if month is more than actual month, and day is more than actual day',
        () {
      final isValid = cardValidations.validateExpirationDate('30/03/2023');
      expect(isValid, equals(true));
    });

    test(
        'should return true if year is more than actual year, but same day and month',
        () {
      final isValid = cardValidations.validateExpirationDate('27/01/2024');
      expect(isValid, equals(true));
    });

    test(
        'should return true if year is more than actual year, but day is less than actual day',
        () {
      final isValid = cardValidations.validateExpirationDate('15/01/2024');
      expect(isValid, equals(true));
    });

    test(
        'should return false if year is less than actual year, but same day and month',
        () {
      final isValid = cardValidations.validateExpirationDate('27/01/2022');
      expect(isValid, equals(false));
    });

    test(
        'should return false if year is less than actual year, but day and month is more than actual date',
        () {
      final isValid = cardValidations.validateExpirationDate('30/11/2022');
      expect(isValid, equals(false));
    });

    test('should return false if day exceed 31', () {
      final isValid = cardValidations.validateExpirationDate('32/01/2023');
      expect(isValid, equals(false));
    });

    test('should return false if day is less than 1', () {
      final isValid = cardValidations.validateExpirationDate('00/01/2023');
      expect(isValid, equals(false));
    });

    test('should return false if month exceed 12', () {
      final isValid = cardValidations.validateExpirationDate('12/13/2023');
      expect(isValid, equals(false));
    });

    test('should return false if month is less than 1', () {
      final isValid = cardValidations.validateExpirationDate('16/00/2022');
      expect(isValid, equals(false));
    });

    test('should return false if day or month has less than 2 digits', () {
      final isValid = cardValidations.validateExpirationDate('1/1/2022');
      expect(isValid, equals(false));
    });

    test('should return false if year has less than 4 digits', () {
      final isValid = cardValidations.validateExpirationDate('01/01/22');
      expect(isValid, equals(false));
    });

    test('should return true if year is more than 10 years', () {
      final isValid = cardValidations.validateExpirationDate('01/01/2033');
      expect(isValid, equals(true));
    });
  });

  group('Validate Card flag:', () {
    setUp(() {
      cardValidations = CardValidations();
    });

    test('should return true if flag has just letters', () {
      final isValid = cardValidations.validateFlag('Visa');
      expect(isValid, equals(true));
    });

    test('should return false if flag has less than 3 letters', () {
      final isValid = cardValidations.validateFlag('El');
      expect(isValid, equals(false));
    });

    test('should return false if flag contains digits', () {
      final isValid = cardValidations.validateFlag('1234');
      expect(isValid, equals(false));
    });
  });

  group('Validate Card buyWithCard', () {
    setUp(() {
      cardValidations = CardValidations();
    });

    test(
        'should return true if buy value does not exceed card limit of account balance',
        () {
      final isValid = cardValidations.validateBuyWithCard('500');
      expect(isValid, equals(true));
    });

    test(
        'should return false if buy value exceed card limit of account balance',
        () {
      final isValid = cardValidations.validateBuyWithCard('2000.50');
      expect(isValid, equals(false));
    });

    test('should return false if buy value contains letters', () {
      final isValid = cardValidations.validateBuyWithCard('R\$2000.50');
      expect(isValid, equals(false));
    });
  });
}
