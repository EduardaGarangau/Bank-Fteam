import 'package:bank_challenge/validations/validations.dart';

class PasswordValidation extends Validation<String> {
  PasswordValidation(super.value);

  @override
  String? validate() {
    final regexPassword = RegExp(r'^[\d]{8}$');

    if (regexPassword.hasMatch(value!)) {
      return null;
    } else {
      return 'Senha inválida. Tente novamente!';
    }
  }
}
