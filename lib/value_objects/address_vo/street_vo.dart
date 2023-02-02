import 'package:bank_challenge/value_objects/value_object.dart';

class StreetVO extends ValueObject<String> {
  StreetVO(super.value);

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
