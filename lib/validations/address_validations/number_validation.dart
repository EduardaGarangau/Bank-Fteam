import 'package:bank_challenge/validations/validations.dart';

class NumberValidation extends Validation<String> {
  NumberValidation(super.value);

  @override
  String? validate() {
    final regexNumber = RegExp(r'^([a-zA-Z]?[0-9]+[a-zA-Z]?)$');

    if (regexNumber.hasMatch(value!)) {
      return null;
    } else {
      return 'Número inválido. Tente Novamente!';
    }
  }
}
