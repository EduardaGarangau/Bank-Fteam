import 'package:bank_challenge/validations/user_validations/email_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate User email:', () {
    test('should return null if email ends with outlook.com', () {
      final isValid = EmailValidation('eduardagarangau@outlook.com').validate();
      expect(isValid, isNull);
    });

    test('should return null if email ends with gmail.com', () {
      final isValid = EmailValidation('eduardagarangau@gmail.com').validate();
      expect(isValid, isNull);
    });

    test('should return null if email ends with hotmail.com', () {
      final isValid = EmailValidation('eduardagarangau@hotmail.com').validate();
      expect(isValid, isNull);
    });

    test('should return null if email ends with outlook.com.br', () {
      final isValid =
          EmailValidation('eduardagarangau@outlook.com.br').validate();
      expect(isValid, isNull);
    });

    test('should return null if email ends with gmail.com.br', () {
      final isValid =
          EmailValidation('eduardagarangau@gmail.com.br').validate();
      expect(isValid, isNull);
    });

    test('should return null if email ends with hotmail.com.br', () {
      final isValid =
          EmailValidation('eduardagarangau@hotmail.com.br').validate();
      expect(isValid, isNull);
    });

    test('should return null if email contains _', () {
      final isValid =
          EmailValidation('eduarda_garangau@hotmail.com').validate();
      expect(isValid, isNull);
    });

    test('should return true if email contains .', () {
      final isValid =
          EmailValidation('eduarda.garangau@hotmail.com').validate();
      expect(isValid, isNull);
    });

    test('should return null if email starts with two letters in upper case',
        () {
      final isValid =
          EmailValidation('EDuarda_garangau@hotmail.com.br').validate();
      expect(isValid, isNull);
    });

    test(
        'should return String if email is different than outlook, gmail or hotmail',
        () {
      final isValid = EmailValidation('eduarda_garangau@gov.com').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if email contains symbols', () {
      final isValid =
          EmailValidation('eduarda#*garangau@hotmail.com').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if email does not contains . in .com and .br',
        () {
      final isValid =
          EmailValidation('eduardagarangau@outlook1com2br').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if email has just empty spaces', () {
      final isValid = EmailValidation(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if email is empty', () {
      final isValid = EmailValidation('').validate();
      expect(isValid, isNotNull);
    });
  });
}
