import 'package:bank_challenge/value_objects/value_object.dart';

class EmailVO extends ValueObject<String> {
  EmailVO(super.value);

  @override
  String? validate() {
    final regexEmail = RegExp(
        r'^[^\d_.-]{1}[a-z\d][a-z-._\d]+(@gmail|@outlook|@hotmail)(\.com)(\.br)?');

    if (regexEmail.hasMatch(value!)) {
      return null;
    } else {
      return 'Email inválido. Tente novamente!';
    }
  }
}
