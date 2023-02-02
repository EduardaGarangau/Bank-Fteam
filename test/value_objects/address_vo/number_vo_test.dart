import 'package:bank_challenge/value_objects/address_vo/number_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address number:', () {
    test('should return null if number has digits', () {
      final isValid = NumberVO('123').validate();
      expect(isValid, isNull);
    });

    test('should return String if number has letters', () {
      final isValid = NumberVO('123a').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if number has just empty spaces', () {
      final isValid = NumberVO(' ').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if number is empty', () {
      final isValid = NumberVO('').validate();
      expect(isValid, isNotNull);
    });
  });
}
