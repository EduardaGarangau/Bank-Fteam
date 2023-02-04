import 'package:bank_challenge/validations/validations.dart';

class BankValidation extends Validation<String> {
  BankValidation(super.value);

  @override
  String? validate() {
    final regexBank = RegExp(r'\b[\d]{3}\b');

    if (regexBank.hasMatch(value!)) {
      return null;
    } else {
      return 'Banco inválido. Tente novamente!';
    }
  }
}
