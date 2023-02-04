import 'package:bank_challenge/models/address_model.dart';

class User {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String cpf;
  final double? montlyIncome;
  final Address address;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.cpf,
    required this.montlyIncome,
    required this.address,
  });

  @override
  String toString() {
    return 'Nome: $name\nEmail: $email\nSenha: $password\nTelefone: $phone\nCPF: $cpf\nRenda: $montlyIncome\nRua: ${address.street}\nNumero: ${address.number}\nComplemento: ${address.complement}\nBairro: ${address.district}\nCidade: ${address.city}\nEstado: ${address.city}\nCEP: ${address.cep}';
  }
}
