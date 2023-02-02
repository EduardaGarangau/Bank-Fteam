import 'package:bank_challenge/value_objects/value_object.dart';

class PhoneVO extends ValueObject<String> {
  PhoneVO(super.value);

  @override
  String? validate() {
    final regexPhone = RegExp(
        r'^([\d]{11})$|^([\d]{2}\s[\d]{9})$|^(\(?[\d]{2}\)?\s[\d]{5}-[\d]{4})$');

    if (regexPhone.hasMatch(value!)) {
      return null;
    } else {
      return 'Telefone inválido. Tente novamente!';
    }
  }
}
