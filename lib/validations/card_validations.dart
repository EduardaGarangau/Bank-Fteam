class CardValidations {
  bool validateExpirationDate(String? date) {
    final regexDate = RegExp(r'^([\d]{2}\/[\d]{2}\/[\d]{4})$');

    if (regexDate.hasMatch(date!)) {
      return _dateIsValid(date);
    } else {
      return false;
    }
  }

  bool _dateIsValid(String date) {
    final actualDate = DateTime.now();
    final dateSplitted = _dateSplitted(date);
    bool validMonth = (dateSplitted[1] <= 12 && dateSplitted[1] >= 1);
    bool validDate = (dateSplitted[0] <= 31 && dateSplitted[0] >= 1);

    if (dateSplitted[0] > actualDate.day &&
        dateSplitted[1] >= actualDate.month &&
        dateSplitted[2] >= actualDate.year &&
        validDate) {
      return true;
    } else if (dateSplitted[1] > actualDate.month &&
        dateSplitted[2] >= actualDate.year &&
        validMonth) {
      return true;
    } else if (dateSplitted[2] > actualDate.year) {
      return true;
    } else {
      return false;
    }
  }

  List<int> _dateSplitted(String date) {
    return date.split('/').map((e) => int.parse(e)).toList();
  }
}
