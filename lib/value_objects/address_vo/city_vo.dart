import 'package:bank_challenge/value_objects/value_object.dart';

class CityVO extends ValueObject<String> {
  CityVO(super.value);

  @override
  String? validate() {
    final regexCity = RegExp(
        r'^([A-Z][a-z]{1,})( [A-Za-z]{1,})?( [A-Za-z]{1,})?( [A-Za-z]{1,})?( [A-Za-z]{1,})?');

    if (regexCity.hasMatch(value!)) {
      return null;
    } else {
      return 'Cidade Inválida. Tente Novamente!';
    }
  }
}
