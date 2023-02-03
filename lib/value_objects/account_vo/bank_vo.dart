import 'package:bank_challenge/value_objects/value_object.dart';

class BankVO extends ValueObject<String> {
  BankVO(super.value);

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
