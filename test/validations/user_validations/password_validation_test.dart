import 'package:bank_challenge/validations/user_validations/password_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate User password:', () {
    test('should return null if password has 8 digits', () {
      final isValid = PasswordValidation('12345678').validate();
      expect(isValid, isNull);
    });

    test('should return String if password has less than 8 digits', () {
      final isValid = PasswordValidation('1234567').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if password has more than 8 digits', () {
      final isValid = PasswordValidation('123456789').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if password contains letters', () {
      final isValid = PasswordValidation('a1234567').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if password has just empty spaces', () {
      final isValid = PasswordValidation(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if password is empty', () {
      final isValid = PasswordValidation('').validate();
      expect(isValid, isNotNull);
    });
  });
}
