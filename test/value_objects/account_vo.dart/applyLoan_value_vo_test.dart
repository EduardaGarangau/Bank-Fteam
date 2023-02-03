import 'package:bank_challenge/value_objects/account_vo.dart/applyLoan_value_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Account applyForLoan', () {
    test(
        'should return null if loan value is between 70% and 20% of User montlyIncome',
        () {
      final isValid = ApplyLoanValueVO(5000, 2468.6).validate();
      expect(isValid, isNull);
    });

    test(
        'should return String if loan value is exceed 70% of User montlyIncome',
        () {
      final isValid = ApplyLoanValueVO(5000, 4000).validate();
      expect(isValid, isNotNull);
    });

    test(
        'should return String if loan value is less than 20% of User montlyIncome',
        () {
      final isValid = ApplyLoanValueVO(5000, 50).value;
      expect(isValid, isNotNull);
    });
  });
}
