import 'package:bank_challenge/value_objects/value_object.dart';

class ApplyLoanValueVO extends ValueObject<double> {
  final double montlyIncome;

  ApplyLoanValueVO(this.montlyIncome, super.value);

  @override
  String? validate() {
    final valid = validateApplyForLoan(value!.toString());
    final accept = acceptApplyForLoan(value!, montlyIncome);

    if (valid != null) {
      return valid;
    } else if (accept != null) {
      return accept;
    } else {
      return null;
    }
  }

  String? validateApplyForLoan(String? value) {
    final regexValue = RegExp(r'^([^+-.$#_a-zA-Z][\d]*\.?([\d]{1,2})?)$');
    if (regexValue.hasMatch(value!)) {
      return null;
    } else {
      return 'Valor digitado inválido. Tente novamente!';
    }
  }

  String? acceptApplyForLoan(double value, double montlyIncome) {
    final seventyPerCent = montlyIncome * 0.7;
    final twentyPerCent = montlyIncome * 0.2;

    if (value >= twentyPerCent && value <= seventyPerCent) {
      return null;
    } else {
      return 'Valor digitado inválido. Tente novamente!';
    }
  }
}
