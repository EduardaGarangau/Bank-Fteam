import 'package:bank_challenge/value_objects/value_object.dart';

class FlagVO extends ValueObject<String> {
  FlagVO(super.value);

  @override
  String? validate() {
    final regexFlag = RegExp(r'\b[A-Za-z]{3,24}\b');

    if (regexFlag.hasMatch(value!)) {
      return null;
    } else {
      return 'Bandeira inválida. Tente novamente!';
    }
  }
}
