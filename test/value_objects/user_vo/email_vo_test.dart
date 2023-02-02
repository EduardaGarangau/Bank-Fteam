import 'package:bank_challenge/value_objects/user_vo/email_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate User email:', () {
    test('should return null if email ends with outlook.com', () {
      final isValid = EmailVO('eduardagarangau@outlook.com').validate();
      expect(isValid, isNull);
    });

    test('should return null if email ends with gmail.com', () {
      final isValid = EmailVO('eduardagarangau@gmail.com').validate();
      expect(isValid, isNull);
    });

    test('should return null if email ends with hotmail.com', () {
      final isValid = EmailVO('eduardagarangau@hotmail.com').validate();
      expect(isValid, isNull);
    });

    test('should return null if email ends with outlook.com.br', () {
      final isValid = EmailVO('eduardagarangau@outlook.com.br').validate();
      expect(isValid, isNull);
    });

    test('should return null if email ends with gmail.com.br', () {
      final isValid = EmailVO('eduardagarangau@gmail.com.br').validate();
      expect(isValid, isNull);
    });

    test('should return null if email ends with hotmail.com.br', () {
      final isValid = EmailVO('eduardagarangau@hotmail.com.br').validate();
      expect(isValid, isNull);
    });

    test('should return null if email contains _', () {
      final isValid = EmailVO('eduarda_garangau@hotmail.com').validate();
      expect(isValid, isNull);
    });

    test('should return String if email starts with _', () {
      final isValid = EmailVO('_eduardagarangau@hotmail.com.br').validate();
      expect(isValid, isNotNull);
    });

    test('should return true if email contains .', () {
      final isValid = EmailVO('eduarda.garangau@hotmail.com').validate();
      expect(isValid, isNull);
    });

    test('should return String if email starts with .', () {
      final isValid = EmailVO('.eduardagarangau@hotmail.com.br').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if email starts with two letters in upper case',
        () {
      final isValid = EmailVO('EDuarda_garangau@hotmail.com.br').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if email is different than outlook, gmail or hotmail',
        () {
      final isValid = EmailVO('eduarda_garangau@gov.com').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if email does not contains . in .com and .br',
        () {
      final isValid = EmailVO('eduardagarangau@outlook1com2br').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if email has just empty spaces', () {
      final isValid = EmailVO(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if email is empty', () {
      final isValid = EmailVO('').validate();
      expect(isValid, isNotNull);
    });
  });
}
