import 'package:bank_challenge/validations/user_validations/montly_income_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate User montlyIncome:', () {
    test('should return null if montlyIncome is 0.01', () {
      final isValid = MontlyIncomeValidation('0.01').validate();
      expect(isValid, isNull);
    });

    test('should return null if montlyIncome is 10.50', () {
      final isValid = MontlyIncomeValidation('10.50').validate();
      expect(isValid, isNull);
    });

    test('should return null if montlyIncome is 5000.00', () {
      final isValid = MontlyIncomeValidation('5000.00').validate();
      expect(isValid, isNull);
    });

    test('should return null if montlyIncome is 5', () {
      final isValid = MontlyIncomeValidation('5').validate();
      expect(isValid, isNull);
    });

    test('should return null if montlyIncome is 45', () {
      final isValid = MontlyIncomeValidation('45').validate();
      expect(isValid, isNull);
    });

    test('should return String if montlyIncome is 40,90', () {
      final isValid = MontlyIncomeValidation('40,90').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if montlyIncome is -0.01', () {
      final isValid = MontlyIncomeValidation('-0.01').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if montlyIncome contains letters', () {
      final isValid = MontlyIncomeValidation('a100').validate();
      expect(isValid, isNotNull);
    });

    test('should return null if montlyIncome is empty to attribute null value',
        () {
      final isValid = MontlyIncomeValidation('').validate();
      expect(isValid, null);
    });
  });
}
