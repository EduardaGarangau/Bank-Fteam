import 'package:bank_challenge/validations/account_validations/value_methods_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Account value for deposit and withdraw:', () {
    test('Should return null if value is a double', () {
      final isValid = ValueMethodsValidation('300.50').validate();
      expect(isValid, isNull);
    });

    test('Should return null if value is a int', () {
      final isValid = ValueMethodsValidation('500').validate();
      expect(isValid, isNull);
    });

    test('Should return String if value contains letters', () {
      final isValid = ValueMethodsValidation('100b').validate();
      expect(isValid, isNotNull);
    });

    test('Should return String if value is empty', () {
      final isValid = ValueMethodsValidation('').validate();
      expect(isValid, isNotNull);
    });
  });
}
