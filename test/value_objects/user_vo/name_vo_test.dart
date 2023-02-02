import 'package:bank_challenge/value_objects/user_vo/name_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate User name:', () {
    test('should return null if name and lastName starts with upper case', () {
      final isValid = NameVO('Eduarda Garangau').validate();
      expect(isValid, isNull);
    });

    test(
        'should return null if name, midleName and lastName starts with upper case',
        () {
      final isValid = NameVO('Eduarda Garangau Miranda').validate();
      expect(isValid, isNull);
    });

    test('should return String if name and lastName starts with lower case',
        () {
      final isValid = NameVO('eduarda garangau').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if contains just name', () {
      final isValid = NameVO('Eduarda').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if all letters in name and last name are in upper case',
        () {
      final isValid = NameVO('EDUARDA GARANGAU').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if name contains digits', () {
      final isValid = NameVO('Eduarda Garangau 2').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if name contains just two letters', () {
      final isValid = NameVO('Ed Garangau').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if name has just empty spaces', () {
      final isValid = NameVO(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if name is empty', () {
      final isValid = NameVO('').validate();
      expect(isValid, isNotNull);
    });
  });
}
