import 'package:bank_challenge/value_objects/value_object.dart';

class NumberVO extends ValueObject<String> {
  NumberVO(super.value);

  @override
  String? validate() {
    final regexNumber = RegExp(r'\b[0-9]+\b');

    if (regexNumber.hasMatch(value!)) {
      return null;
    } else {
      return 'Número inválido. Tente Novamente!';
    }
  }
}
