import 'package:bank_challenge/validations/address_validations/state_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address state:', () {
    test('should return null if state has two letters in upper case', () {
      final isValid = StateValidation('PR').validate();
      expect(isValid, isNull);
    });

    test('should return String if state has two letters in lower case', () {
      final isValid = StateValidation('mg').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if state has more than two letters in upper case',
        () {
      final isValid = StateValidation('PRO').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if state contains digits', () {
      final isValid = StateValidation('S2').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if state has just empty spaces', () {
      final isValid = StateValidation(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if state is empty', () {
      final isValid = StateValidation('').validate();
      expect(isValid, isNotNull);
    });
  });
}
