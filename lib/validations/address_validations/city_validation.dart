import 'package:bank_challenge/validations/validations.dart';

class CityValidation extends Validation<String> {
  CityValidation(super.value);

  @override
  String? validate() {
    final regexCity = RegExp(
        r'^([A-Z][a-z]{1,})( [A-Za-z]{1,})?( [A-Za-z]{1,})?( [A-Za-z]{1,})?( [A-Za-z]{1,})?$');

    if (regexCity.hasMatch(value!)) {
      return null;
    } else {
      return 'Cidade Inválida. Tente Novamente!';
    }
  }
}
