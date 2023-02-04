import 'package:bank_challenge/validations/user_validations/phone_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate User phone:', () {
    test('should return null if has 11 digits without () and -', () {
      final isValid = PhoneValidation('41999789087').validate();
      expect(isValid, isNull);
    });

    test('should return String if has more than 11 digits without () and -',
        () {
      final isValid = PhoneValidation('419997890870').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if has less than 11 digits without () and -',
        () {
      final isValid = PhoneValidation('419997890').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return null if has 2 digits in ddd without () and 9 digits without -',
        () {
      final isValid = PhoneValidation('41 997623456').validate();
      expect(isValid, isNull);
    });

    test(
        'should return String if ddd has more than 2 digits without () and 9 digits without -',
        () {
      final isValid = PhoneValidation('411 997623456').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd has less than 2 digits without () and 9 digits without -',
        () {
      final isValid = PhoneValidation('4 997623456').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd has 2 digits without () and more than 9 digits without -',
        () {
      final isValid = PhoneValidation('41 9976234568').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd has 2 digits without () and less than 9 digits without -',
        () {
      final isValid = PhoneValidation('41 99762347').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return null if ddd has 2 digits without () and 5 digits before - and 4 digits after -',
        () {
      final isValid = PhoneValidation('41 99976-7643').validate();
      expect(isValid, isNull);
    });

    test(
        'should return String if ddd has more than 2 digits without () and 5 digits before - and 4 digits after -',
        () {
      final isValid = PhoneValidation('412 99976-7643').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd has less than 2 digits without () and 5 digits before - and 4 digits after -',
        () {
      final isValid = PhoneValidation('4 99976-7643').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd has 2 digits without () and more than 5 digits before -',
        () {
      final isValid = PhoneValidation('41 999766-7643').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd has 2 digits without () and less than 5 digits before -',
        () {
      final isValid = PhoneValidation('41 9997-7643').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if ddd and digits are not divided by one space',
        () {
      final isValid = PhoneValidation('4199975-7647').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd and digits are divided by more than one space',
        () {
      final isValid = PhoneValidation('41  99975-7647').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return null if ddd has 2 digits with () and 5 digits before - and 4 digits after -',
        () {
      final isValid = PhoneValidation('(11) 98741-2233').validate();
      expect(isValid, isNull);
    });

    test(
        'should return String if ddd has more than 2 digits with () and 5 digits before - and 4 digits after -',
        () {
      final isValid = PhoneValidation('(111) 98741-2233').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd has less than 2 digits with () and 5 digits before - and 4 digits after -',
        () {
      final isValid = PhoneValidation('(1) 98741-2233').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd has 2 digits with () and more than 5 digits before -',
        () {
      final isValid = PhoneValidation('(11) 987414-2233').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd has 2 digits with () and less than 5 digits before -',
        () {
      final isValid = PhoneValidation('(11) 9874-2233').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd has 2 digits with () and more than 4 digits after -',
        () {
      final isValid = PhoneValidation('(11) 98741-22333').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd has 2 digits with () and less than 4 digits after -',
        () {
      final isValid = PhoneValidation('(11) 98741-223').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd has 2 digits with () digits are not divided by -',
        () {
      final isValid = PhoneValidation('(11) 987412233').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if ddd and digits are not divided by one space',
        () {
      final isValid = PhoneValidation('(11)98741-2233').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ddd and digits are divided by more than one space',
        () {
      final isValid = PhoneValidation('(11)  98741-2233').validate();
      expect(isValid, isNotNull);
    });
  });
}
