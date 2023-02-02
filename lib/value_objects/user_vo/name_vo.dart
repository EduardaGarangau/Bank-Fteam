import 'package:bank_challenge/value_objects/value_object.dart';

class NameVO extends ValueObject<String> {
  NameVO(super.value);

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
