import 'package:bank_challenge/value_objects/account_vo.dart/deposit_value_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Account withdraw', () {
    test('should return null if deposit value does not exceed 5000', () {
      final isValid = DepositValueVO(2500.90).validate();
      expect(isValid, isNull);
    });

    test('should return String if deposit value exceed 5000', () {
      final isValid = DepositValueVO(5500).validate();
      expect(isValid, isNotNull);
    });
  });
}
