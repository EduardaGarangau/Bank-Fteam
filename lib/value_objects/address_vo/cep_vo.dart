import 'package:bank_challenge/value_objects/value_object.dart';

class CepVO extends ValueObject<String> {
  CepVO(super.value);

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
