import 'package:bank_challenge/validations/address_validations/city_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address city:', () {
    test('should return null if city has one word that starts with upper case',
        () {
      final isValid = CityValidation('Curitiba').validate();
      expect(isValid, isNull);
    });

    test(
        'should return null if city has words that starts with upper case and lower case',
        () {
      final isValid = CityValidation('Rio Grande do Sul').validate();
      expect(isValid, isNull);
    });

    test('should return String if city contains digits', () {
      final isValid = CityValidation('Mato Grosso 1').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if city starts with lower case', () {
      final isValid = CityValidation('parana').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if city has just empty spaces', () {
      final isValid = CityValidation(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if city is empty', () {
      final isValid = CityValidation('').validate();
      expect(isValid, isNotNull);
    });
  });
}
