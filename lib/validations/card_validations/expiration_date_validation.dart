import 'package:bank_challenge/validations/validations.dart';

class ExpirationDateValidation extends Validation<String> {
  ExpirationDateValidation(super.value);

  @override
  String? validate() {
    final regexDate = RegExp(r'^([\d]{2}\/[\d]{4})$');

    if (regexDate.hasMatch(value!) &&
        _monthIsValid(value!) &&
        _tenYearsVality(value!)) {
      return null;
    } else {
      return 'Data invalida. Tente novamente!';
    }
  }

  bool _tenYearsVality(String date) {
    final dateSplitted = _dateSplitted(date);
    final tenYearThanActualYear = DateTime.now().year + 10;
    final yearProvided = dateSplitted[1];

    if (yearProvided == tenYearThanActualYear) {
      return true;
    } else {
      return false;
    }
  }

  bool _monthIsValid(String date) {
    final dateSplitted = _dateSplitted(date);
    if (dateSplitted[0] <= 12) {
      return true;
    } else {
      return false;
    }
  }

  List<int> _dateSplitted(String date) {
    return date.split('/').map((e) => int.parse(e)).toList();
  }
}
