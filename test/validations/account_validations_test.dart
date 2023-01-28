import 'package:bank_challenge/validations/account_validations.dart';
import 'package:test/test.dart';

void main() {
  late AccountValidations accountValidations;

  group('Validate Account bank:', () {
    setUp(() {
      accountValidations = AccountValidations();
    });

    test('Should return true if bank has 3 digits', () {
      final isValid = accountValidations.validateBank('123');
      expect(isValid, equals(true));
    });

    test('Should return false if bank has less than 3 digits', () {
      final isValid = accountValidations.validateBank('12');
      expect(isValid, equals(false));
    });

    test('Should return false if bank has more than 3 digits', () {
      final isValid = accountValidations.validateBank('1122');
      expect(isValid, equals(false));
    });

    test('Should return false if bank contains letters', () {
      final isValid = accountValidations.validateBank('1a2');
      expect(isValid, equals(false));
    });
  });
}
