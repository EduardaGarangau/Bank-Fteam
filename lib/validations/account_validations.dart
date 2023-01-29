class AccountValidations {
  bool validateBank(String? bank) {
    final regexBank = RegExp(r'\b[\d]{3}\b');

    if (regexBank.hasMatch(bank!)) {
      return true;
    } else {
      return false;
    }
  }

  bool validateWithdraw(String? value) {
    final regexValue = RegExp(r'^([^+-.$#_a-zA-Z][\d]*\.?([\d]{1,2})?)$');
    if (regexValue.hasMatch(value!)) {
      return true;
    } else {
      return false;
    }
  }

  bool acceptWithdraw(double value, double balance) {
    if (value <= balance) {
      return true;
    } else {
      return false;
    }
  }

  bool validateDeposit(String? value) {
    final regexValue = RegExp(r'^([^+-.$#_a-zA-Z][\d]*\.?([\d]{1,2})?)$');
    if (regexValue.hasMatch(value!)) {
      return true;
    } else {
      return false;
    }
  }

  bool acceptDeposit(double value) {
    if (value <= 5000) {
      return true;
    } else {
      return false;
    }
  }

  bool validateApplyForLoan(String? valueString, double montlyIncome) {
    final regexValue = RegExp(r'^([^+-.$#_a-zA-Z][\d]*\.?([\d]{1,2})?)$');
    if (regexValue.hasMatch(valueString!)) {
      final value = double.parse(valueString);
      return _acceptApplyForLoan(value, montlyIncome);
    } else {
      return false;
    }
  }

  bool _acceptApplyForLoan(double value, double montlyIncome) {
    final seventyPerCent = montlyIncome * 0.7;
    final twentyPerCent = montlyIncome * 0.2;

    if (value >= twentyPerCent && value <= seventyPerCent) {
      return true;
    } else {
      return false;
    }
  }

  bool validateRenderBalance(String? days) {
    final regexDays = RegExp(r'^[0-9]*$');
    if (regexDays.hasMatch(days!)) {
      return true;
    } else {
      return false;
    }
  }
}
