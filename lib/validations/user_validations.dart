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
}
