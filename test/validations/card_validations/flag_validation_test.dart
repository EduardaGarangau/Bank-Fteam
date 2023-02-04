import 'package:bank_challenge/validations/card_validations/flag_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Card flag:', () {
    test('should return null if flag has just letters', () {
      final isValid = FlagValidation('Visa').validate();
      expect(isValid, isNull);
    });

    test('should return String if flag has less than 3 letters', () {
      final isValid = FlagValidation('El').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if flag contains digits', () {
      final isValid = FlagValidation('1234').validate();
      expect(isValid, isNotNull);
    });
  });
}
