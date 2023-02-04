import 'package:bank_challenge/validations/validations.dart';

class StateValidation extends Validation<String> {
  StateValidation(super.value);

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
