import 'package:bank_challenge/value_objects/account_vo.dart/withdraw_value_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Account withdraw:', () {
    test('should return null if withdraw value does not exceed balance', () {
      final isValid = WithdrawValueVO(1000, 50).validate();
      expect(isValid, isNull);
    });

    test('should return String if withdraw value exceed balance', () {
      final isValid = WithdrawValueVO(1000, 1200).validate();
      expect(isValid, isNotNull);
    });
  });
}
