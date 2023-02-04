import 'package:bank_challenge/validations/validations.dart';

class CepValidation extends Validation<String> {
  CepValidation(super.value);

  @override
  String? validate() {
    final regexCep = RegExp(r'\b([0-9]{5}-[0-9]{3})\b|\b([0-9]{8})\b');

    if (regexCep.hasMatch(value!)) {
      return null;
    } else {
      return 'CEP inválido. Tente novamente!';
    }
  }
}
