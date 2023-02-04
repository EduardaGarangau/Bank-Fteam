import 'package:bank_challenge/validations/card_validations/expiration_date_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Card expirationDate:', () {
    test('Should return null if date is ten year later', () {
      final isValid = ExpirationDateValidation('01/2033').validate();
      expect(isValid, isNull);
    });

    test('Should return String if date is not ten year later', () {
      final isValid = ExpirationDateValidation('02/2025').validate();
      expect(isValid, isNotNull);
    });
  });
}
