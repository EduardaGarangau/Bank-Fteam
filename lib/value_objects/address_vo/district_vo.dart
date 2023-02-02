import 'package:bank_challenge/value_objects/value_object.dart';

class DistrictVO extends ValueObject<String> {
  DistrictVO(super.value);

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
