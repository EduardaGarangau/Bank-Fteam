import 'package:bank_challenge/validations/address_validations/complement_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address complement:', () {
    test('should return null if complement is Sobrado 3', () {
      final isValid = ComplementValidation('Sobrado 3').validate();
      expect(isValid, isNull);
    });

    test('should return null if complement is Ap 302', () {
      final isValid = ComplementValidation('Ap 302').validate();
      expect(isValid, isNull);
    });

    test('should return null if complement starts with lower case', () {
      final isValid = ComplementValidation('ap 302').validate();
      expect(isValid, isNotNull);
    });

    test('should return null if complement is empty', () {
      final isValid = ComplementValidation('').validate();
      expect(isValid, isNull);
    });
  });
}
