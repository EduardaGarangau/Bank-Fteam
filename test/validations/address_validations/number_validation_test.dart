import 'package:bank_challenge/validations/address_validations/number_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address number:', () {
    test('should return null if number has digits', () {
      final isValid = NumberValidation('123').validate();
      expect(isValid, isNull);
    });

    test('should return null if number starts with letter', () {
      final isValid = NumberValidation('a123').validate();
      expect(isValid, isNull);
    });

    test('should return null if number ends with letter', () {
      final isValid = NumberValidation('a123').validate();
      expect(isValid, isNull);
    });

    test('should return String if number has just empty spaces', () {
      final isValid = NumberValidation(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if number is empty', () {
      final isValid = NumberValidation('').validate();
      expect(isValid, isNotNull);
    });
  });
}
