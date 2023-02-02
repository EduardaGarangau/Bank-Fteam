import 'package:bank_challenge/value_objects/user_vo/montlyIncome_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate User montlyIncome:', () {
    test('should return null if montlyIncome is 0.01', () {
      final isValid = MontlyIncomeVO('0.01').validate();
      expect(isValid, isNull);
    });

    test('should return null if montlyIncome is 10.50', () {
      final isValid = MontlyIncomeVO('10.50').validate();
      expect(isValid, isNull);
    });

    test('should return null if montlyIncome is 5000.00', () {
      final isValid = MontlyIncomeVO('5000.00').validate();
      expect(isValid, isNull);
    });

    test('should return null if montlyIncome is 5', () {
      final isValid = MontlyIncomeVO('5').validate();
      expect(isValid, isNull);
    });

    test('should return null if montlyIncome is 45', () {
      final isValid = MontlyIncomeVO('45').validate();
      expect(isValid, isNull);
    });

    test('should return String if montlyIncome is 40,90', () {
      final isValid = MontlyIncomeVO('40,90').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if montlyIncome is -0.01', () {
      final isValid = MontlyIncomeVO('-0.01').validate();
      expect(isValid, isNotNull);
    });

    test('should return null if montlyIncome is empty to attribute null value',
        () {
      final isValid = MontlyIncomeVO('').validate();
      expect(isValid, null);
    });
  });
}
