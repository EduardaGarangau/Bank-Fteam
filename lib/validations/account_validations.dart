class AccountValidations {
  bool validateBank(String? bank) {
    final regexBank = RegExp(r'\b[\d]{3}\b');

    if (regexBank.hasMatch(bank!)) {
      return true;
    } else {
      return false;
    }
  }
}
