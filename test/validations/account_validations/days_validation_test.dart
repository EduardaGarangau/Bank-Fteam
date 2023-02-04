import 'package:bank_challenge/validations/account_validations/days_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Account days to renderBalance', () {
    test('Should return null if days is an int number', () {
      final isValid = DaysValidation('30').validate();
      expect(isValid, isNull);
    });

    test('Should return String if days contains letters', () {
      final isValid = DaysValidation('1a').validate();
      expect(isValid, isNotNull);
    });
  });
}
