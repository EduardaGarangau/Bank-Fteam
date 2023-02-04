import 'package:bank_challenge/validations/address_validations/district_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address district:', () {
    test(
        'should return null if district has two words that starts with upper case',
        () {
      final isValid = DistrictValidation('Jardim Social').validate();
      expect(isValid, isNull);
    });

    test(
        'should return null if district has three words that starts with upper case',
        () {
      final isValid = DistrictValidation('Jardim Social Teste').validate();
      expect(isValid, isNull);
    });

    test(
        'should return null if district has one words that starts with upper case',
        () {
      final isValid = DistrictValidation('Bacacheri').validate();
      expect(isValid, isNull);
    });

    test('should return String if district starts with lower case', () {
      final isValid = DistrictValidation('cabral').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if district contains digits', () {
      final isValid = DistrictValidation('cabral 2').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if district has just empty spaces', () {
      final isValid = DistrictValidation(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if district is empty', () {
      final isValid = DistrictValidation('').validate();
      expect(isValid, isNotNull);
    });
  });
}
