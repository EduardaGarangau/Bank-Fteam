class UserValidations {
  bool validateName(String? name) {
    final regexName =
        RegExp(r'^([A-Z][a-z]{2,})( [A-Z][a-z]{2,})?( [A-Z][a-z]{2,})$');

    if (regexName.hasMatch(name!)) {
      return true;
    } else {
      return false;
    }
  }

  bool validateEmail(String? email) {
    final regexEmail = RegExp(
        r'^[^\d_.-]{1}[a-z\d][a-z-._\d]+(@gmail|@outlook|@hotmail)(\.com)(\.br)?');

    if (regexEmail.hasMatch(email!)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword(String? password) {
    final regexPassword = RegExp(r'^[\d]{8}$');

    if (regexPassword.hasMatch(password!)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePhone(String? phone) {
    final regexPhone = RegExp(
        r'^([\d]{11})$|^([\d]{2}\s[\d]{9})$|^(\(?[\d]{2}\)?\s[\d]{5}-[\d]{4})$');

    if (regexPhone.hasMatch(phone!)) {
      return true;
    } else {
      return false;
    }
  }

  bool validateMontlyIncome(String? montlyIncome) {
    final regexMontlyIncome =
        RegExp(r'^([^+-.$#_a-zA-Z][\d]*\.?([\d]{1,2})?)$');

    if (regexMontlyIncome.hasMatch(montlyIncome!)) {
      return true;
    } else {
      return false;
    }
  }

  bool validateCpf(String? cpf) {
    final regexCpf = RegExp(r'^([\d]{3}\.[\d]{3}\.[\d]{3}-[\d]{2})$');

    if (regexCpf.hasMatch(cpf!)) {
      return _cpfIsValid(cpf);
    } else {
      return false;
    }
  }

  bool _cpfIsValid(String cpf) {
    final cpfNumbers = _cpfNumbers(cpf);
    final tenthNumber = cpfNumbers[9];
    final eleventhNumber = cpfNumbers[10];
    int firstCheckerDigit = _verifyCheckerDigit(cpf, 10, 9);
    int secondCheckerDigit = _verifyCheckerDigit(cpf, 11, 10);

    if (tenthNumber == firstCheckerDigit &&
        eleventhNumber == secondCheckerDigit) {
      return true;
    } else {
      return false;
    }
  }

  int _verifyCheckerDigit(String cpf, int multiplyBy, int takeDigits) {
    int result = 0;
    int count = 0;
    final numbers = _cpfNumbers(cpf).take(takeDigits).toList();
    for (var i = multiplyBy; i >= 2; i--) {
      final mult = numbers[count] * i;
      count++;
      result += mult;
    }
    final divible = (result * 10) % 11;
    if (divible == 10) {
      return 0;
    } else {
      return divible;
    }
  }

  List<int> _cpfNumbers(String cpf) {
    final formattedCpf = (cpf.replaceAll('.', '')).replaceAll('-', '');
    return formattedCpf.split('').map((e) => int.parse(e)).toList();
  }
}
