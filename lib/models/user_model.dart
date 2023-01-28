import 'package:bank_challenge/models/address_model.dart';

class User {
  final String name;
  final String email;
  late String password;
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
    required this.password,
    this.monthlyIncome,
  });

  @override
  String toString() {
    return '| DADOS PESSOAIS |\nNome: $name\nEmail: $email\nTelefone: $phone\nCPF: $cpf\nRenda Mensal: $monthlyIncome\n| ENDEREÇO |\nRua: ${address.street}\nNumero: ${address.number}\nComplemento: ${address.complement}\nBairro: ${address.district}\nCidade: ${address.city}\nEstado: ${address.state}\nCEP: ${address.cep}';
  }
}
