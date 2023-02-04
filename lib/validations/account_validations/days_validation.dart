import 'package:bank_challenge/validations/validations.dart';

class DaysValidation extends Validation<String> {
  DaysValidation(super.value);

  @override
  String? validate() {
    final regexDays = RegExp(r'^[0-9]*$');
    if (regexDays.hasMatch(value.toString())) {
      return null;
    } else {
      return 'Valor inválido. Tente novamente!';
    }
  }
}
