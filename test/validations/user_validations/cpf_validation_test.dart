import 'package:bank_challenge/validations/user_validations/cpf_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Validate user CPF:', () {
    test('should return null if cpf is 049.427.230-94', () {
      final isValid = CpfValidation('049.427.230-94').validate();
      expect(isValid, isNull);
    });

    test('should return null if cpf is 358.760.060-09', () {
      final isValid = CpfValidation('358.760.060-09').validate();
      expect(isValid, isNull);
    });

    test('should return null if cpf is 595.956.630-34', () {
      final isValid = CpfValidation('595.956.630-34').validate();
      expect(isValid, isNull);
    });

    test('should return String if cpf is 042.427.230-94', () {
      final isValid = CpfValidation('042.427.230-94').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cpf is 358.768.060-09', () {
      final isValid = CpfValidation('358.768.060-09').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cpf is 595.956.930-34', () {
      final isValid = CpfValidation('595.956.930-34').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if cpf does not contains - or .', () {
      final isValid = CpfValidation('08591413903').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ordinary numbers of cpf has more than 3 numbers',
        () {
      final isValid = CpfValidation('0855.9144.1399-03').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if ordinary numbers of cpf has less than 3 numbers',
        () {
      final isValid = CpfValidation('08.911.19-03').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if checkers numbers of cpf has more than 2 numbers',
        () {
      final isValid = CpfValidation('085.914.139-032').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if checkers numbers of cpf has less than 2 numbers',
        () {
      final isValid = CpfValidation('085.914.139-0').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if does not have checkers numbers', () {
      final isValid = CpfValidation('085.914.139').validate();
      expect(isValid, isNotNull);
    });
  });
}
