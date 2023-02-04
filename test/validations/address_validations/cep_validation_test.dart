import 'package:bank_challenge/validations/address_validations/cep_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address CEP:', () {
    test('should return null if cep has 5 digits - 3 digits', () {
      final isValid = CepValidation('82520-550').validate();
      expect(isValid, isNull);
    });

    test('should return String if cep has more than 5 digits - 3 digits', () {
      final isValid = CepValidation('825200-550').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep has 5 digits - more than 3 digits', () {
      final isValid = CepValidation('82520-5500').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep has less than 5 digits - 3 digits', () {
      final isValid = CepValidation('8259-550').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep has 5 digits - less than 3 digits', () {
      final isValid = CepValidation('82520-55').validate();
      expect(isValid, isNotNull);
    });

    test('should return null if cep has 8 digits', () {
      final isValid = CepValidation('82520550').validate();
      expect(isValid, isNull);
    });

    test('should return String if cep has more than 8 digits', () {
      final isValid = CepValidation('825205500').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep has less than 8 digits', () {
      final isValid = CepValidation('8252055').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep contains letters', () {
      final isValid = CepValidation('8252055a').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep has just empty spaces', () {
      final isValid = CepValidation(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep is empty', () {
      final isValid = CepValidation('').validate();
      expect(isValid, isNotNull);
    });
  });
}
