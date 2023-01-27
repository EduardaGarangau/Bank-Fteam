import 'package:bank_challenge/validations/user_validations.dart';
import 'package:test/test.dart';

void main() {
  late UserValidations userValidations;
  group('Validate User name:', () {
    setUp(() {
      userValidations = UserValidations();
    });
    test(
        'should return true if name and last name starts with upper case letter',
        () {
      final isValid = userValidations.validateName('Eduarda Garangau');
      expect(isValid, equals(true));
    });

    test(
        'should return true if name, middle name and last name starts with upper case letter',
        () {
      final isValid = userValidations.validateName('Eduarda Garangau Miranda');
      expect(isValid, equals(true));
    });

    test(
        'should return false if name and last name starts with lower case letter',
        () {
      final isValid = userValidations.validateName('eduarda garangau');
      expect(isValid, equals(false));
    });

    test('should return false if does not contains last name or middle name',
        () {
      final isValid = userValidations.validateName('Eduarda');
      expect(isValid, equals(false));
    });

    test('should return false if name and last name are in upper case letters',
        () {
      final isValid = userValidations.validateName('EDUARDA GARANGAU');
      expect(isValid, equals(false));
    });

    test('should return false if contains numbers in the end', () {
      final isValid = userValidations.validateName('Eduarda Garangau 2');
      expect(isValid, equals(false));
    });

    test('should return false if contains numbers in the middle', () {
      final isValid = userValidations.validateName('Eduarda 2 Garangau');
      expect(isValid, equals(false));
    });

    test('should return false if contains numbers in the start', () {
      final isValid = userValidations.validateName('2 Eduarda Garangau');
      expect(isValid, equals(false));
    });

    test('should return false if name has just 2 letters', () {
      final isValid = userValidations.validateName('Ed Garangau');
      expect(isValid, equals(false));
    });

    test('should return false if last name has just 2 letters', () {
      final isValid = userValidations.validateName('Eduarda Ga');
      expect(isValid, equals(false));
    });

    test('should return false if middle name and last name has just 2 letters',
        () {
      final isValid = userValidations.validateName('Eduarda Ga Mi');
      expect(isValid, equals(false));
    });

    test('should return false if user type just spaces', () {
      final isValid = userValidations.validateName(' ');
      expect(isValid, equals(false));
    });

    test('should return false if user does not type anything', () {
      final isValid = userValidations.validateName('');
      expect(isValid, equals(false));
    });
  });

  group('Validate User email:', () {
    setUp(() {
      userValidations = UserValidations();
    });

    test('should return true if email ends with outlook.com', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@outlook.com');
      expect(isValid, equals(true));
    });

    test('should return true if email ends with gmail.com', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@gmail.com');
      expect(isValid, equals(true));
    });

    test('should return true if email ends with hotmail.com', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@hotmail.com');
      expect(isValid, equals(true));
    });

    test('should return true if email ends with outlook.com.br', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@outlook.com.br');
      expect(isValid, equals(true));
    });

    test('should return true if email ends with gmail.com.br', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@gmail.com.br');
      expect(isValid, equals(true));
    });

    test('should return true if email ends with hotmail.com.br', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@hotmail.com.br');
      expect(isValid, equals(true));
    });

    test('should return true if email contains _', () {
      final isValid =
          userValidations.validateEmail('eduarda_garangau@hotmail.com.br');
      expect(isValid, equals(true));
    });

    test('should return false if email starts with _', () {
      final isValid =
          userValidations.validateEmail('_eduardagarangau@hotmail.com.br');
      expect(isValid, equals(false));
    });

    test('should return true if email contains .', () {
      final isValid =
          userValidations.validateEmail('eduarda.garangau@hotmail.com.br');
      expect(isValid, equals(true));
    });

    test('should return false if email starts with .', () {
      final isValid =
          userValidations.validateEmail('.eduardagarangau@hotmail.com.br');
      expect(isValid, equals(false));
    });

    test('should return true if email starts with upper case letter', () {
      final isValid =
          userValidations.validateEmail('Eduarda_garangau@hotmail.com.br');
      expect(isValid, equals(true));
    });

    test('should return false if email starts with two letters in upper case',
        () {
      final isValid =
          userValidations.validateEmail('EDuarda_garangau@hotmail.com.br');
      expect(isValid, equals(false));
    });

    test('Should return true if email contains number', () {
      final isValid =
          userValidations.validateEmail('e23ardagarangau@gmail.com');
      expect(isValid, equals(true));
    });

    test('Should return false if email starts with number', () {
      final isValid =
          userValidations.validateEmail('3duardagarangau@gmail.com');
      expect(isValid, equals(false));
    });

    test(
        'should return false if email is different than outlook, gmail and hotmail',
        () {
      final isValid = userValidations.validateEmail('eduarda_garangau@gov.com');
      expect(isValid, equals(false));
    });

    test('should return false if email contains symbols', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau#@!@gmail.com');
      expect(isValid, equals(false));
    });

    test('should return false if email dows not contains . in .com and .br',
        () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@outlook1com2br');
      expect(isValid, equals(false));
    });
  });

  group('Validade User password:', () {
    setUp(() {
      userValidations = UserValidations();
    });

    test('should return true if password has 8 numbers', () {
      final isValid = userValidations.validatePassword('76290065');
      expect(isValid, equals(true));
    });

    test('should return false if password has less than 8 numbers', () {
      final isValid = userValidations.validatePassword('998877');
      expect(isValid, equals(false));
    });

    test('should return false if password has more than 8 numbers', () {
      final isValid = userValidations.validatePassword('123456789');
      expect(isValid, equals(false));
    });

    test('should return false if password contains letters', () {
      final isValid = userValidations.validatePassword('123a1111');
      expect(isValid, equals(false));
    });
  });
}
