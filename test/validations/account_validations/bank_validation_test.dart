import 'package:bank_challenge/validations/account_validations/bank_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Account bank:', () {
    test('Should return null if bank has 3 digits', () {
      final isValid = BankValidation('123').validate();
      expect(isValid, isNull);
    });

    test('Should return String if bank has less than 3 digits', () {
      final isValid = BankValidation('12').validate();
      expect(isValid, isNotNull);
    });

    test('Should return String if bank has more than 3 digits', () {
      final isValid = BankValidation('1267').validate();
      expect(isValid, isNotNull);
    });

    test('Should return String if bank contains letters', () {
      final isValid = BankValidation('12e').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if bank has just empty spaces', () {
      final isValid = BankValidation(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if bank is empty', () {
      final isValid = BankValidation('').validate();
      expect(isValid, isNotNull);
    });
  });
}
