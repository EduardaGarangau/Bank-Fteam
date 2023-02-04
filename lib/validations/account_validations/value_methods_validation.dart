import 'package:bank_challenge/validations/validations.dart';

class ValueMethodsValidation extends Validation<String> {
  ValueMethodsValidation(super.value);

  @override
  String? validate() {
    final regexValue = RegExp(r'^([^+-.$#_a-zA-Z][\d]*\.?([\d]{1,2})?)$');
    if (regexValue.hasMatch(value!)) {
      return null;
    } else {
      return 'Valor digitado inválido. Tente novamente!';
    }
  }
}
