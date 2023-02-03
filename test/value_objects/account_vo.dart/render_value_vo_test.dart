import 'package:bank_challenge/value_objects/account_vo.dart/render_value_vo.dart';
import 'package:test/test.dart';

void main() {
  group('Validate Account renderBalance', () {
    test('Should return null if days is an int number', () {
      final isValid = RenderValueVO(4).validate();
      expect(isValid, isNull);
    });
  });
}
