import 'package:bank_challenge/value_objects/address_vo/complement_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Address complement:', () {
    test('should return null if complement is Sobrado 3', () {
      final isValid = ComplementVO('Sobrado 3').validate();
      expect(isValid, isNull);
    });

    test('should return null if complement is Ap 302', () {
      final isValid = ComplementVO('Ap 302').validate();
      expect(isValid, isNull);
    });

    test('should return null if complement starts with lower case', () {
      final isValid = ComplementVO('ap 302').validate();
      expect(isValid, isNotNull);
    });

    test('should return null if complement is null', () {
      final isValid = ComplementVO(null).validate();
      expect(isValid, isNull);
    });
  });
}
