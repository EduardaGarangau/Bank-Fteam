import 'package:bank_challenge/validations/validations.dart';

class ComplementValidation extends Validation<String> {
  ComplementValidation(super.value);

  @override
  String? validate() {
    final regexComplement = RegExp(r'([A-Z][a-z]{1,12})( [0-9]+)');

    if (regexComplement.hasMatch(value.toString()) || value!.isEmpty) {
      return null;
    } else {
      return 'Complemento inválido. Tente novamente!';
    }
  }
}
