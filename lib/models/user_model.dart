import 'package:bank_challenge/models/address_model.dart';
import 'package:bank_challenge/value_objects/user_vo/email_vo.dart';
import 'package:bank_challenge/value_objects/user_vo/montlyIncome_vo.dart';
import 'package:bank_challenge/value_objects/user_vo/name_vo.dart';
import 'package:bank_challenge/value_objects/user_vo/password_vo.dart';
import '../value_objects/user_vo/cpf_vo.dart';
import '../value_objects/user_vo/phone_vo.dart';

class User {
  NameVO _name;
  EmailVO _email;
  PasswordVO _password;
  PhoneVO _phone;
  CpfVO _cpf;
  MontlyIncomeVO _monthlyIncome;
  late Address address;

  NameVO get name => _name;
  void setName(String value) => _name = NameVO(value);

  EmailVO get email => _email;
  void setEmail(String value) => _email = EmailVO(value);

  PasswordVO get password => _password;
  void setPassword(String value) => _password = PasswordVO(value);

  PhoneVO get phone => _phone;
  void setPhone(String value) => _phone = PhoneVO(value);

  CpfVO get cpf => _cpf;
  void setCpf(String value) => _cpf = CpfVO(value);

  MontlyIncomeVO get montlyIncome => _monthlyIncome;
  void setMontlyIncome(String value) {
    value.isEmpty
        ? _monthlyIncome = MontlyIncomeVO(null)
        : _monthlyIncome = MontlyIncomeVO(double.tryParse(value));
  }

  User({
    required name,
    required email,
    required password,
    required phone,
    required cpf,
    required montlyIncome,
    required this.address,
  })  : _name = NameVO(name),
        _email = EmailVO(email),
        _password = PasswordVO(password),
        _phone = PhoneVO(phone),
        _cpf = CpfVO(cpf),
        _monthlyIncome = MontlyIncomeVO(montlyIncome);

  @override
  String toString() {
    return '\nNome: ${name.value}\nEmail: ${email.value}\nSenha: ${password.value}\nTelefone: ${phone.value}\nCPF: ${cpf.value}\nRenda Mensal: ${montlyIncome.value}\nRua: ${address.street.value}\nNúmero: ${address.number.value}\nComplemento: ${address.complement.value}\nBairro: ${address.district.value}\nCidade: ${address.city.value}\nEstado: ${address.state.value}\nCEP: ${address.cep.value}';
  }
}
