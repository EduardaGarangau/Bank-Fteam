import 'package:bank_challenge/value_objects/value_object.dart';

class PasswordVO extends ValueObject<String> {
  PasswordVO(super.value);

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
