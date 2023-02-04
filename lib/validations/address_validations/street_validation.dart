import 'package:bank_challenge/validations/validations.dart';

class StreetValidation extends Validation<String> {
  StreetValidation(super.value);

  @override
  String? validate() {
    final regexStreet = RegExp(
        r'^([A-Za-z]{1,})( [A-Za-z]{1,})?( [A-Za-z]{1,})?( [A-Za-z]{1,})?( [A-Za-z]{1,})?$');

    if (regexStreet.hasMatch(value!)) {
      return null;
    } else {
      return 'Rua inválida. Tente novamente!';
    }
  }
}
