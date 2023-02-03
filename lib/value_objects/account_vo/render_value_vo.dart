import 'package:bank_challenge/value_objects/value_object.dart';

class RenderValueVO extends ValueObject<int> {
  RenderValueVO(super.value);

  @override
  String? validate() {
    final regexDays = RegExp(r'^[0-9]*$');
    if (regexDays.hasMatch(value.toString())) {
      return null;
    } else {
      return 'Valor inválido. Tente novamente!';
    }
  }
}
