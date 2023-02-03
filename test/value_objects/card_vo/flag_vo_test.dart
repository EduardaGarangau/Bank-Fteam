import 'package:bank_challenge/value_objects/card_vo/flag_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Card flag:', () {
    test('should return null if flag has just letters', () {
      final isValid = FlagVO('Visa').validate();
      expect(isValid, isNull);
    });

    test('should return String if flag has less than 3 letters', () {
      final isValid = FlagVO('El').validate();
      expect(isValid, isNotNull);
    });

    test('should return String if flag contains digits', () {
      final isValid = FlagVO('1234').validate();
      expect(isValid, isNotNull);
    });
  });
}
