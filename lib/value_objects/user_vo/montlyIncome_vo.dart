import 'package:bank_challenge/value_objects/value_object.dart';

class MontlyIncomeVO extends ValueObject<dynamic> {
  MontlyIncomeVO(super.value);

  @override
  String? validate() {
    final regexMontlyIncome =
        RegExp(r'^([^+-.$#_a-zA-Z][\d]*\.?([\d]{1,2})?)$');

    if (regexMontlyIncome.hasMatch(value.toString()) || value == null) {
      return null;
    } else {
      return 'Renda mensal inválida. Tente novamente!';
    }
  }
}
