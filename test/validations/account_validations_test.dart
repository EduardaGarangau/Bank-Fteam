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

  group('Validate Account withdraw:', () {
    setUp(() {
      accountValidations = AccountValidations();
    });

    test('should return true if withdraw value does not exceed balance', () {
      final isValid = accountValidations.validateWithdraw('1800');
      expect(isValid, equals(true));
    });

    test('should return false if withdraw value exceed balance', () {
      final isValid = accountValidations.validateWithdraw('1800.50');
      expect(isValid, equals(false));
    });

    test('should return false if withdraw value contains letters', () {
      final isValid = accountValidations.validateWithdraw('R\$1800');
      expect(isValid, equals(false));
    });
  });

  group('Validate Account deposit', () {
    setUp(() {
      accountValidations = AccountValidations();
    });
    test('should return true if deposit value does not exceed 5000', () {
      final isValid = accountValidations.validateDeposit('2500.90');
      expect(isValid, equals(true));
    });

    test('should return false if deposit value exceed 5000', () {
      final isValid = accountValidations.validateDeposit('5500');
      expect(isValid, equals(false));
    });

    test('should return false if deposit value contains letters', () {
      final isValid = accountValidations.validateDeposit('R\$1800');
      expect(isValid, equals(false));
    });
  });

  group('Validate Account applyForLoan', () {
    setUp(() {
      accountValidations = AccountValidations();
    });

    test(
        'should return true if loan value is between 70% and 20% of User montlyIncome',
        () {
      final isValid = accountValidations.validateApplyForLoan('2468.6', 5000);
      expect(isValid, equals(true));
    });

    test('should return false if loan value is exceed 70% of User montlyIncome',
        () {
      final isValid = accountValidations.validateApplyForLoan('4000', 5000);
      expect(isValid, equals(false));
    });

    test(
        'should return false if loan value is less than 20% of User montlyIncome',
        () {
      final isValid = accountValidations.validateApplyForLoan('500', 5000);
      expect(isValid, equals(false));
    });

    test('should return false if loan value contains letters', () {
      final isValid = accountValidations.validateApplyForLoan('R\$3000', 5000);
      expect(isValid, equals(false));
    });
  });

  group('Validate Account renderBalance', () {
    setUp(() {
      accountValidations = AccountValidations();
    });

    test('Should return true if days is an int number', () {
      final isValid = accountValidations.validateRenderBalance('30');
      expect(isValid, equals(true));
    });

    test('Should return false if days is an double number', () {
      final isValid = accountValidations.validateRenderBalance('2.5');
      expect(isValid, equals(false));
    });

    test('Should return false if days contains letters', () {
      final isValid = accountValidations.validateRenderBalance('2 days');
      expect(isValid, equals(false));
    });
  });
}
