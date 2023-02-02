import 'package:bank_challenge/value_objects/address_vo/street_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address street:', () {
    test('should return null if street is Rua Jose Mario de Oliveira', () {
      final isValid = StreetVO('Rua Jose Mario de Oliveira').validate();
      expect(isValid, isNull);
    });

    test('should return String if street contains digits', () {
      final isValid = StreetVO('Rua Jose Mario de 13').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if street contains just empty spaces', () {
      final isValid = StreetVO(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if street is empty', () {
      final isValid = StreetVO('').validate();
      expect(isValid, isNotNull);
    });
  });
}
