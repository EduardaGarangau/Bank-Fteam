import 'package:bank_challenge/validations/validations.dart';

class ValuePayValidation extends Validation<String> {
  ValuePayValidation(super.value);

  @override
  String? validate() {
    final regexValue = RegExp(r'^([^+-.$#_a-zA-Z][\d]*\.?([\d]{1,2})?)$');

    if (regexValue.hasMatch(value!)) {
      return null;
    } else {
      return 'Valor inválido. Tente novamente!';
    }
  }
}
