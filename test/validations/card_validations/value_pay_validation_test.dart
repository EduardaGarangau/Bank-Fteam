import 'package:bank_challenge/validations/card_validations/value_pay_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Value to pay debit and credit card', () {
    test('Should return null if value is a double', () {
      final isValid = ValuePayValidation('300.50').validate();
      expect(isValid, isNull);
    });

    test('Should return null if value is a int', () {
      final isValid = ValuePayValidation('500').validate();
      expect(isValid, isNull);
    });

    test('Should return String if value contains letters', () {
      final isValid = ValuePayValidation('100b').validate();
      expect(isValid, isNotNull);
    });

    test('Should return String if value is empty', () {
      final isValid = ValuePayValidation('').validate();
      expect(isValid, isNotNull);
    });
  });
}
