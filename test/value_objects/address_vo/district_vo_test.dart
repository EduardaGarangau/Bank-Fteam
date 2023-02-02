import 'package:bank_challenge/value_objects/address_vo/district_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address district:', () {
    test(
        'should return null if district has two words that starts with upper case',
        () {
      final isValid = DistrictVO('Jardim Social').validate();
      expect(isValid, isNull);
    });

    test(
        'should return null if district has three words that starts with upper case',
        () {
      final isValid = DistrictVO('Jardim Social Teste').validate();
      expect(isValid, isNull);
    });

    test(
        'should return null if district has one words that starts with upper case',
        () {
      final isValid = DistrictVO('Bacacheri').validate();
      expect(isValid, isNull);
    });

    test('should return String if district starts with lower case', () {
      final isValid = DistrictVO('cabral').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if district contains digits', () {
      final isValid = DistrictVO('cabral 2').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if district has just empty spaces', () {
      final isValid = DistrictVO(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if district is empty', () {
      final isValid = DistrictVO('').validate();
      expect(isValid, isNotNull);
    });
  });
}
