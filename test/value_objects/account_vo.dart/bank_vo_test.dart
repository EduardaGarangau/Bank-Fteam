import 'package:bank_challenge/value_objects/account_vo.dart/bank_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Account bank:', () {
    test('Should return null if bank has 3 digits', () {
      final isValid = BankVO('123').validate();
      expect(isValid, isNull);
    });

    test('Should return String if bank has less than 3 digits', () {
      final isValid = BankVO('12').validate();
      expect(isValid, isNotNull);
    });

    test('Should return String if bank has more than 3 digits', () {
      final isValid = BankVO('1267').validate();
      expect(isValid, isNotNull);
    });

    test('Should return String if bank contains letters', () {
      final isValid = BankVO('12e').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if bank has just empty spaces', () {
      final isValid = BankVO(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if bank is empty', () {
      final isValid = BankVO('').validate();
      expect(isValid, isNotNull);
    });
  });
}
