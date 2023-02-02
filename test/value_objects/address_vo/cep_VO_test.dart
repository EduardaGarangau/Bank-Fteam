import 'package:bank_challenge/value_objects/address_vo/cep_VO.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address CEP:', () {
    test('should return null if cep has 5 digits - 3 digits', () {
      final isValid = CepVO('82520-550').validate();
      expect(isValid, isNull);
    });

    test('should return String if cep has more than 5 digits - 3 digits', () {
      final isValid = CepVO('825200-550').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep has 5 digits - more than 3 digits', () {
      final isValid = CepVO('82520-5500').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep has less than 5 digits - 3 digits', () {
      final isValid = CepVO('8259-550').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep has 5 digits - less than 3 digits', () {
      final isValid = CepVO('82520-55').validate();
      expect(isValid, isNotNull);
    });

    test('should return null if cep has 8 digits', () {
      final isValid = CepVO('82520550').validate();
      expect(isValid, isNull);
    });

    test('should return String if cep has more than 8 digits', () {
      final isValid = CepVO('825205500').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep has less than 8 digits', () {
      final isValid = CepVO('8252055').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep contains letters', () {
      final isValid = CepVO('8252055a').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep has just empty spaces', () {
      final isValid = CepVO(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cep is empty', () {
      final isValid = CepVO('').validate();
      expect(isValid, isNotNull);
    });
  });
}
