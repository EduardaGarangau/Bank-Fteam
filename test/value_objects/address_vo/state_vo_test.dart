import 'package:bank_challenge/value_objects/address_vo/state_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address state:', () {
    test('should return null if state has two letters in upper case', () {
      final isValid = StateVO('PR').validate();
      expect(isValid, isNull);
    });

    test('should return String if state has two letters in lower case', () {
      final isValid = StateVO('mg').validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if state has more than two letters in upper case',
        () {
      final isValid = StateVO('PRO').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if state contains digits', () {
      final isValid = StateVO('S2').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if state has just empty spaces', () {
      final isValid = StateVO(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if state is empty', () {
      final isValid = StateVO('').validate();
      expect(isValid, isNotNull);
    });
  });
}
