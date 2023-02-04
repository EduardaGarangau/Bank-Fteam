import 'package:bank_challenge/validations/user_validations/name_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate User name:', () {
    test('should return null if name and lastName starts with upper case', () {
      final isValid = NameValidation('Eduarda Garangau').validate();
      expect(isValid, isNull);
    });

    test(
        'should return null if name, midleName and lastName starts with upper case',
        () {
      final isValid = NameValidation('Eduarda Garangau Miranda').validate();
      expect(isValid, isNull);
    });

    test('should return String if name and lastName starts with lower case',
        () {
      final isValid = NameValidation('eduarda garangau').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if contains just name', () {
      final isValid = NameValidation('Eduarda').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if all letters in name and last name are in upper case',
        () {
      final isValid = NameValidation('EDUARDA GARANGAU').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if name contains digits', () {
      final isValid = NameValidation('Eduarda Garangau 2').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if name contains just two letters', () {
      final isValid = NameValidation('Ed Garangau').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if name has just empty spaces', () {
      final isValid = NameValidation(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if name is empty', () {
      final isValid = NameValidation('').validate();
      expect(isValid, isNotNull);
    });
  });
}
