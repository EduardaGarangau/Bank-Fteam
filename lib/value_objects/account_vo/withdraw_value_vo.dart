import 'package:bank_challenge/value_objects/value_object.dart';

class WithdrawValueVO extends ValueObject<double> {
  final double balance;

  WithdrawValueVO(this.balance, super.value);

  @override
  String? validate() {
    final valid = validateWithdraw(value!.toString());
    final accept = acceptWithdraw(value!, balance);

    if (valid != null) {
      return valid;
    } else if (accept != null) {
      return accept;
    } else {
      return null;
    }
  }

  String? validateWithdraw(String? value) {
    final regexValue = RegExp(r'^([^+-.$#_a-zA-Z][\d]*\.?([\d]{1,2})?)$');
    if (regexValue.hasMatch(value!)) {
      return null;
    } else {
      return 'Valor digitado inválido. Tente novamente!';
    }
  }

  String? acceptWithdraw(double value, double balance) {
    if (value <= balance) {
      return null;
    } else {
      return 'Operação cancelada! Saldo atual é: $balance';
    }
  }
}
