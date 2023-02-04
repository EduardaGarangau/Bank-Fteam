import 'package:bank_challenge/validations/validations.dart';

class CpfValidation extends Validation<String> {
  CpfValidation(super.value);

  @override
  String? validate() {
    final regexCpf = RegExp(r'^([\d]{3}\.[\d]{3}\.[\d]{3}-[\d]{2})$');

    if (regexCpf.hasMatch(value!)) {
      if (_cpfIsValid(value!)) {
        return null;
      } else {
        return 'CPF inválido. Tente novamente!';
      }
    } else {
      return 'CPF inválido. Tente novamente!';
    }
  }

  bool _cpfIsValid(String value) {
    final cpfNumbers = _cpfNumbers(value);
    final tenthNumber = cpfNumbers[9];
    final eleventhNumber = cpfNumbers[10];
    int firstCheckerDigit = _verifyCheckerDigit(value, 10, 9);
    int secondCheckerDigit = _verifyCheckerDigit(value, 11, 10);

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
