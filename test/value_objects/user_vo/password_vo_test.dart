import 'package:bank_challenge/value_objects/user_vo/password_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate User password:', () {
    test('should return null if password has 8 digits', () {
      final isValid = PasswordVO('12345678').validate();
      expect(isValid, isNull);
    });

    test('should return String if password has less than 8 digits', () {
      final isValid = PasswordVO('1234567').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if password has more than 8 digits', () {
      final isValid = PasswordVO('123456789').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if password contains letters', () {
      final isValid = PasswordVO('a1234567').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if password has just empty spaces', () {
      final isValid = PasswordVO(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if password is empty', () {
      final isValid = PasswordVO('').validate();
      expect(isValid, isNotNull);
    });
  });
}
