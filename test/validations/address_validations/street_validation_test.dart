import 'package:bank_challenge/validations/address_validations/street_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address street:', () {
    test('should return null if street is Rua Jose Mario de Oliveira', () {
      final isValid = StreetValidation('Rua Jose Mario de Oliveira').validate();
      expect(isValid, isNull);
    });

    test('should return String if street contains digits', () {
      final isValid = StreetValidation('Rua Jose Mario de 13').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if street not starts with upper case', () {
      final isValid = StreetValidation('rua Jose Mario de 13').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if street contains just empty spaces', () {
      final isValid = StreetValidation(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if street is empty', () {
      final isValid = StreetValidation('').validate();
      expect(isValid, isNotNull);
    });
  });
}
