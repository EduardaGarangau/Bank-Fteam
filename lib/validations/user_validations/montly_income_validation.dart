import 'package:bank_challenge/validations/validations.dart';

class MontlyIncomeValidation extends Validation<String> {
  MontlyIncomeValidation(super.value);

  @override
  String? validate() {
    final regexMontlyIncome =
        RegExp(r'^([^+-.$#_a-zA-Z][\d]*\.?([\d]{1,2})?)$');

    if (regexMontlyIncome.hasMatch(value.toString()) || value!.isEmpty) {
      return null;
    } else {
      return 'Renda mensal inválida. Tente novamente!';
    }
  }
}
