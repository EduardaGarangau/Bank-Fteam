import 'package:bank_challenge/validations/validations.dart';

class NameValidation extends Validation<String> {
  NameValidation(super.value);

  @override
  String? validate() {
    final regexName =
        RegExp(r'^([A-Z][a-z]{2,})( [A-Z][a-z]{2,})?( [A-Z][a-z]{2,})$');
    if (regexName.hasMatch(value!)) {
      return null;
    } else {
      return 'Nome inválido. Tente novamente!';
    }
  }
}
