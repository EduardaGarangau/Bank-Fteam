import 'package:bank_challenge/value_objects/value_object.dart';

class StateVO extends ValueObject<String> {
  StateVO(super.value);

  @override
  String? validate() {
    final regexState = RegExp(r'^[A-Z]{2}$');

    if (regexState.hasMatch(value!)) {
      return null;
    } else {
      return 'Estado inválido. Tente novamente!';
    }
  }
}
