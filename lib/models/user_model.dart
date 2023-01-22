// ignore_for_file: unused_field
import 'package:bank_challenge/models/address_model.dart';

class User {
  final String name;
  final String email;
  late String _password;
  final String phone;
  final String cpf;
  final Address address;
  double? monthlyIncome;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.cpf,
    required this.address,
    required String password,
    this.monthlyIncome,
  }) {
    _validatePassword(password)
        ? _password = password
        : throw Exception('Senha inválida');
  }

  bool _validatePassword(String password) {
    if (password.length != 8 || password.contains(RegExp(r'[A-Za-z]'))) {
      return false;
    } else {
      return true;
    }
  }
}
