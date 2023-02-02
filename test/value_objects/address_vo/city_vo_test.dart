import 'package:bank_challenge/value_objects/address_vo/city_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address city:', () {
    test('should return null if city has one word that starts with upper case',
        () {
      final isValid = CityVO('Curitiba').validate();
      expect(isValid, isNull);
    });

    test(
        'should return null if city has words that starts with upper case and lower case',
        () {
      final isValid = CityVO('Rio Grande do Sul').validate();
      expect(isValid, isNull);
    });

    test('should return String if city contains digits', () {
      final isValid = CityVO('Mato Grosso 2').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if city starts with lower case', () {
      final isValid = CityVO('parana').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if city has just empty spaces', () {
      final isValid = CityVO(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if city is empty', () {
      final isValid = CityVO('').validate();
      expect(isValid, isNotNull);
    });
  });
}
