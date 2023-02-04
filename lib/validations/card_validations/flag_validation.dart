import 'package:bank_challenge/validations/validations.dart';

class FlagValidation extends Validation<String> {
  FlagValidation(super.value);

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
