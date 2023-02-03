import 'package:bank_challenge/value_objects/value_object.dart';

class DepositValueVO extends ValueObject<double> {
  DepositValueVO(super.value);

  @override
  String? validate() {
    final valid = validateDeposit(value!.toString());
    final accept = acceptDeposit(value!);

    if (valid != null) {
      return valid;
    } else if (accept != null) {
      return accept;
    } else {
      return null;
    }
  }

  String? validateDeposit(String? value) {
    final regexValue = RegExp(r'^([^+-.$#_a-zA-Z][\d]*\.?([\d]{1,2})?)$');
    if (regexValue.hasMatch(value!)) {
      return null;
    } else {
      return 'Valor digitado inválido. Tente novamente!';
    }
  }

  String? acceptDeposit(double value) {
    if (value <= 5000) {
      return null;
    } else {
      return 'Operação cancelada! Só é possível depositar no máximo R\$5000.00';
    }
  }
}
