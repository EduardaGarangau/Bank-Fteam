import 'package:bank_challenge/validations/user_validations.dart';
import 'package:test/test.dart';

void main() {
  late UserValidations userValidations;
  group('Validate User name:', () {
    setUp(() {
      userValidations = UserValidations();
    });
    test(
        'should return true if name and last name starts with upper case letter',
        () {
      final isValid = userValidations.validateName('Eduarda Garangau');
      expect(isValid, equals(true));
    });

    test(
        'should return true if name, middle name and last name starts with upper case letter',
        () {
      final isValid = userValidations.validateName('Eduarda Garangau Miranda');
      expect(isValid, equals(true));
    });

    test(
        'should return false if name and last name starts with lower case letter',
        () {
      final isValid = userValidations.validateName('eduarda garangau');
      expect(isValid, equals(false));
    });

    test('should return false if does not contains last name or middle name',
        () {
      final isValid = userValidations.validateName('Eduarda');
      expect(isValid, equals(false));
    });

    test('should return false if name and last name are in upper case letters',
        () {
      final isValid = userValidations.validateName('EDUARDA GARANGAU');
      expect(isValid, equals(false));
    });

    test('should return false if contains digits in the end', () {
      final isValid = userValidations.validateName('Eduarda Garangau 2');
      expect(isValid, equals(false));
    });

    test('should return false if contains digits in the middle', () {
      final isValid = userValidations.validateName('Eduarda 2 Garangau');
      expect(isValid, equals(false));
    });

    test('should return false if contains digits in the start', () {
      final isValid = userValidations.validateName('2 Eduarda Garangau');
      expect(isValid, equals(false));
    });

    test('should return false if name has just 2 letters', () {
      final isValid = userValidations.validateName('Ed Garangau');
      expect(isValid, equals(false));
    });

    test('should return false if last name has just 2 letters', () {
      final isValid = userValidations.validateName('Eduarda Ga');
      expect(isValid, equals(false));
    });

    test('should return false if middle name has just 2 letters', () {
      final isValid = userValidations.validateName('Eduarda Ga Miranda');
      expect(isValid, equals(false));
    });

    test('should return false if user type just spaces', () {
      final isValid = userValidations.validateName(' ');
      expect(isValid, equals(false));
    });

    test('should return false if user does not type anything', () {
      final isValid = userValidations.validateName('');
      expect(isValid, equals(false));
    });
  });

  group('Validate User email:', () {
    setUp(() {
      userValidations = UserValidations();
    });

    test('should return true if email ends with outlook.com', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@outlook.com');
      expect(isValid, equals(true));
    });

    test('should return true if email ends with gmail.com', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@gmail.com');
      expect(isValid, equals(true));
    });

    test('should return true if email ends with hotmail.com', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@hotmail.com');
      expect(isValid, equals(true));
    });

    test('should return true if email ends with outlook.com.br', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@outlook.com.br');
      expect(isValid, equals(true));
    });

    test('should return true if email ends with gmail.com.br', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@gmail.com.br');
      expect(isValid, equals(true));
    });

    test('should return true if email ends with hotmail.com.br', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@hotmail.com.br');
      expect(isValid, equals(true));
    });

    test('should return true if email contains _', () {
      final isValid =
          userValidations.validateEmail('eduarda_garangau@hotmail.com.br');
      expect(isValid, equals(true));
    });

    test('should return false if email starts with _', () {
      final isValid =
          userValidations.validateEmail('_eduardagarangau@hotmail.com.br');
      expect(isValid, equals(false));
    });

    test('should return true if email contains .', () {
      final isValid =
          userValidations.validateEmail('eduarda.garangau@hotmail.com.br');
      expect(isValid, equals(true));
    });

    test('should return false if email starts with .', () {
      final isValid =
          userValidations.validateEmail('.eduardagarangau@hotmail.com.br');
      expect(isValid, equals(false));
    });

    test('should return true if email starts with upper case letter', () {
      final isValid =
          userValidations.validateEmail('Eduarda_garangau@hotmail.com.br');
      expect(isValid, equals(true));
    });

    test('should return false if email starts with two letters in upper case',
        () {
      final isValid =
          userValidations.validateEmail('EDuarda_garangau@hotmail.com.br');
      expect(isValid, equals(false));
    });

    test('Should return true if email contains digits', () {
      final isValid =
          userValidations.validateEmail('e23ardagarangau@gmail.com');
      expect(isValid, equals(true));
    });

    test('Should return false if email starts with digits', () {
      final isValid =
          userValidations.validateEmail('3duardagarangau@gmail.com');
      expect(isValid, equals(false));
    });

    test(
        'should return false if email is different than outlook, gmail or hotmail',
        () {
      final isValid = userValidations.validateEmail('eduarda_garangau@gov.com');
      expect(isValid, equals(false));
    });

    test('should return false if email contains symbols', () {
      final isValid =
          userValidations.validateEmail('eduardagarangau#@!@gmail.com');
      expect(isValid, equals(false));
    });

    test('should return false if email does not contains . in .com and .br',
        () {
      final isValid =
          userValidations.validateEmail('eduardagarangau@outlook1com2br');
      expect(isValid, equals(false));
    });

    test('should return false if user type just spaces', () {
      final isValid = userValidations.validateEmail(' ');
      expect(isValid, equals(false));
    });

    test('should return false if user does not type anything', () {
      final isValid = userValidations.validateEmail('');
      expect(isValid, equals(false));
    });
  });

  group('Validade User password:', () {
    setUp(() {
      userValidations = UserValidations();
    });

    test('should return true if password has 8 digits', () {
      final isValid = userValidations.validatePassword('76290065');
      expect(isValid, equals(true));
    });

    test('should return false if password has less than 8 digits', () {
      final isValid = userValidations.validatePassword('998877');
      expect(isValid, equals(false));
    });

    test('should return false if password has more than 8 digits', () {
      final isValid = userValidations.validatePassword('123456789');
      expect(isValid, equals(false));
    });

    test('should return false if password contains letters', () {
      final isValid = userValidations.validatePassword('123a1111');
      expect(isValid, equals(false));
    });

    test('should return false if user type just spaces', () {
      final isValid = userValidations.validatePassword(' ');
      expect(isValid, equals(false));
    });

    test('should return false if user does not type anything', () {
      final isValid = userValidations.validatePassword('');
      expect(isValid, equals(false));
    });
  });

  group('Validate User phone:', () {
    setUp(() {
      userValidations = UserValidations();
    });
    test('should return true if has 11 digits without () and -', () {
      final isValid = userValidations.validatePhone('41999789087');
      expect(isValid, equals(true));
    });

    test('should return false if has more than 11 digits without () and -', () {
      final isValid = userValidations.validatePhone('419997890870');
      expect(isValid, equals(false));
    });

    test('should return false if has less than 11 digits without () and -', () {
      final isValid = userValidations.validatePhone('419997890');
      expect(isValid, equals(false));
    });

    test(
        'should return true if has 2 digits in ddd without () and 9 digits without -',
        () {
      final isValid = userValidations.validatePhone('41 997623456');
      expect(isValid, equals(true));
    });

    test(
        'should return false if ddd has more than 2 digits without () and 9 digits without -',
        () {
      final isValid = userValidations.validatePhone('411 997623456');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has less than 2 digits without () and 9 digits without -',
        () {
      final isValid = userValidations.validatePhone('4 997623456');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has 2 digits without () and more than 9 digits without -',
        () {
      final isValid = userValidations.validatePhone('41 9976234568');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has 2 digits without () and less than 9 digits without -',
        () {
      final isValid = userValidations.validatePhone('41 99762347');
      expect(isValid, equals(false));
    });

    test(
        'should return true if ddd has 2 digits without () and 5 digits before - and 4 digits after -',
        () {
      final isValid = userValidations.validatePhone('41 99976-7643');
      expect(isValid, equals(true));
    });

    test(
        'should return false if ddd has more than 2 digits without () and 5 digits before - and 4 digits after -',
        () {
      final isValid = userValidations.validatePhone('412 99976-7643');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has less than 2 digits without () and 5 digits before - and 4 digits after -',
        () {
      final isValid = userValidations.validatePhone('4 99976-7643');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has 2 digits without () and more than 5 digits before -',
        () {
      final isValid = userValidations.validatePhone('41 999766-7643');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has 2 digits without () and less than 5 digits before -',
        () {
      final isValid = userValidations.validatePhone('41 9997-7643');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has 2 digits without () and more than 4 digits after -',
        () {
      final isValid = userValidations.validatePhone('41 99975-76436');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has 2 digits without () and less than 4 digits after -',
        () {
      final isValid = userValidations.validatePhone('41 99975-764');
      expect(isValid, equals(false));
    });

    test('should return false if ddd and digits are not divided by one space',
        () {
      final isValid = userValidations.validatePhone('4199975-7647');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd and digits are divided by more than one space',
        () {
      final isValid = userValidations.validatePhone('41  99975-7647');
      expect(isValid, equals(false));
    });

    test(
        'should return true if ddd has 2 digits with () and 5 digits before - and 4 digits after -',
        () {
      final isValid = userValidations.validatePhone('(11) 98741-2233');
      expect(isValid, equals(true));
    });

    test(
        'should return false if ddd has more than 2 digits with () and 5 digits before - and 4 digits after -',
        () {
      final isValid = userValidations.validatePhone('(111) 98741-2233');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has less than 2 digits with () and 5 digits before - and 4 digits after -',
        () {
      final isValid = userValidations.validatePhone('(1) 98741-2233');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has 2 digits with () and more than 5 digits before -',
        () {
      final isValid = userValidations.validatePhone('(11) 987414-2233');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has 2 digits with () and less than 5 digits before -',
        () {
      final isValid = userValidations.validatePhone('(11) 9874-2233');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has 2 digits with () and more than 4 digits after -',
        () {
      final isValid = userValidations.validatePhone('(11) 98741-22333');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has 2 digits with () and less than 4 digits after -',
        () {
      final isValid = userValidations.validatePhone('(11) 98741-223');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd has 2 digits with () digits are not divided by -',
        () {
      final isValid = userValidations.validatePhone('(11) 987412233');
      expect(isValid, equals(false));
    });

    test('should return false if ddd and digits are not divided by one space',
        () {
      final isValid = userValidations.validatePhone('(11)98741-2233');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ddd and digits are divided by more than one space',
        () {
      final isValid = userValidations.validatePhone('(11)  98741-2233');
      expect(isValid, equals(false));
    });
  });

  group('Validate User montlyIncome:', () {
    setUp(() {
      userValidations = UserValidations();
    });

    test('should return true if montlyIncome is 0.01', () {
      final isValid = userValidations.validateMontlyIncome('0.01');
      expect(isValid, equals(true));
    });

    test('should return true if montlyIncome is 10.50', () {
      final isValid = userValidations.validateMontlyIncome('10.50');
      expect(isValid, equals(true));
    });

    test('should return true if montlyIncome is 5000.00', () {
      final isValid = userValidations.validateMontlyIncome('5000.00');
      expect(isValid, equals(true));
    });

    test('should return true if montlyIncome is 5', () {
      final isValid = userValidations.validateMontlyIncome('5');
      expect(isValid, equals(true));
    });

    test('should return true if montlyIncome is 45', () {
      final isValid = userValidations.validateMontlyIncome('45');
      expect(isValid, equals(true));
    });

    test('should return false if montlyIncome is 40,90', () {
      final isValid = userValidations.validateMontlyIncome('40,90');
      expect(isValid, equals(false));
    });

    test('should return false if montlyIncome is -0.01', () {
      final isValid = userValidations.validateMontlyIncome('-0.01');
      expect(isValid, equals(false));
    });

    test('should return true if montlyIncome is empty to attribute null value',
        () {
      final isValid = userValidations.validateMontlyIncome(' ');
      expect(isValid, equals(true));
    });
  });

  group('Validate User cpf:', () {
    setUp(() {
      userValidations = UserValidations();
    });

    test('should return true if cpf is 049.427.230-94', () {
      final isValid = userValidations.validateCpf('049.427.230-94');
      expect(isValid, equals(true));
    });

    test('should return true if cpf is 358.760.060-09', () {
      final isValid = userValidations.validateCpf('358.760.060-09');
      expect(isValid, equals(true));
    });

    test('should return true if cpf is 595.956.630-34', () {
      final isValid = userValidations.validateCpf('595.956.630-34');
      expect(isValid, equals(true));
    });

    test('should return false if cpf is 042.427.230-94', () {
      final isValid = userValidations.validateCpf('042.427.230-94');
      expect(isValid, equals(false));
    });

    test('should return false if cpf is 358.768.060-09', () {
      final isValid = userValidations.validateCpf('358.768.060-09');
      expect(isValid, equals(false));
    });

    test('should return false if cpf is 595.956.930-34', () {
      final isValid = userValidations.validateCpf('595.956.930-34');
      expect(isValid, equals(false));
    });

    test('should return false if cpf does not contains - or .', () {
      final isValid = userValidations.validateCpf('08591413903');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ordinary numbers of cpf has more than 3 numbers',
        () {
      final isValid = userValidations.validateCpf('0855.9144.1399-03');
      expect(isValid, equals(false));
    });

    test(
        'should return false if ordinary numbers of cpf has less than 3 numbers',
        () {
      final isValid = userValidations.validateCpf('08.911.19-03');
      expect(isValid, equals(false));
    });

    test(
        'should return false if checkers numbers of cpf has more than 2 numbers',
        () {
      final isValid = userValidations.validateCpf('085.914.139-032');
      expect(isValid, equals(false));
    });

    test(
        'should return false if checkers numbers of cpf has less than 2 numbers',
        () {
      final isValid = userValidations.validateCpf('085.914.139-0');
      expect(isValid, equals(false));
    });

    test('should return false if does not have checkers numbers', () {
      final isValid = userValidations.validateCpf('085.914.139');
      expect(isValid, equals(false));
    });
  });
}
