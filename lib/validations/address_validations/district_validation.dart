import 'package:bank_challenge/validations/validations.dart';

class DistrictValidation extends Validation<String> {
  DistrictValidation(super.value);

  @override
  String? validate() {
    final regexDistrict =
        RegExp(r'^([A-Z][a-z]{2,})( [A-Z][a-z]{2,})?( [A-Z][a-z]{2,})?$');

    if (regexDistrict.hasMatch(value!)) {
      return null;
    } else {
      return 'Bairro Inválido. Tente Novamente!';
    }
  }
}
