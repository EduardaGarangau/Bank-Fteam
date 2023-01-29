import 'dart:core';

class CardValidations {
  bool validateExpirationDate(String? date) {
    final regexDate = RegExp(r'^([\d]{2}\/[\d]{2}\/[\d]{4})$');

    if (regexDate.hasMatch(date!)) {
      return _dateIsValid(date) && _tenYearsVality(date);
    } else {
      return false;
    }
  }

  bool validateFlag(String? flag) {
    final regexFlag = RegExp(r'\b[A-Za-z]{3,24}\b');

    if (regexFlag.hasMatch(flag!)) {
      return true;
    } else {
      return false;
    }
  }

  bool validateBuyWithCard(String? value) {
    final regexValue = RegExp(r'^([^+-.$#_a-zA-Z][\d]*\.?([\d]{1,2})?)$');
    if (regexValue.hasMatch(value!)) {
      return true;
    } else {
      return false;
    }
  }

  bool acceptBuyWithCard(double value, double limitOrBalance) {
    if (value <= limitOrBalance && limitOrBalance != 0.0) {
      return true;
    } else {
      return false;
    }
  }

  bool _tenYearsVality(String date) {
    final dateSplitted = _dateSplitted(date);
    final tenYearThanActualYear = DateTime.now().year + 10;
    final yearProvided = dateSplitted[2];

    if (yearProvided == tenYearThanActualYear) {
      return true;
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
