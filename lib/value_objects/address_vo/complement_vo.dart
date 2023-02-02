import 'package:bank_challenge/value_objects/value_object.dart';

class ComplementVO extends ValueObject<dynamic> {
  ComplementVO(super.value);

  @override
  String? validate() {
    final regexComplement = RegExp(r'([A-Z][a-z]{1,12})( [0-9]+)');

    if (regexComplement.hasMatch(value.toString()) || value == null) {
      return null;
    } else {
      return 'Complemento inválido. Tente novamente!';
    }
  }
}
