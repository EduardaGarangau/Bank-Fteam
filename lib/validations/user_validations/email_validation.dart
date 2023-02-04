import 'package:bank_challenge/validations/validations.dart';

class EmailValidation extends Validation<String> {
  EmailValidation(super.value);

  @override
  String? validate() {
    final regexEmail =
        RegExp(r'^[a-zA-Z-._\d]+(@gmail|@outlook|@hotmail)(\.com)(\.br)?$');

    if (regexEmail.hasMatch(value!)) {
      return null;
    } else {
      return 'Email inválido. Tente novamente!';
    }
  }
}
