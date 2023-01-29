import 'dart:io';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/models/address_model.dart';
import 'package:bank_challenge/models/user_model.dart';
import 'package:bank_challenge/validations/user_validations.dart';

class UserInput {
  final _userValidations = UserValidations();
  Map<String, dynamic> _userData = {};

  User createUser() {
    stdout.writeln('--DIGITE SEUS DADOS PESSOAIS--');
    _inputName();
    final user = User(
      name: _userData['name'],
      email: _userData['email'],
      phone: _userData['phone'],
      cpf: _userData['cpf'],
      address: Address(
        street: _userData['street'],
        number: _userData['number'],
        district: _userData['district'],
        city: _userData['city'],
        state: _userData['state'],
        cep: _userData['cep'],
        complement: _userData['complement'],
      ),
      password: _userData['password'],
      monthlyIncome: _userData['montlyIncome'],
    );
    InputMessages.userCreatedMessage();
    return user;
  }

  void _inputName() {
    stdout.writeln('Digite seu nome:');
    final name = stdin.readLineSync();
    if (_userValidations.validateName(name)) {
      _userData['name'] = name;
      _inputEmail();
    } else {
      stderr.writeln('Nome inválido! Tente novamente');
      _inputName();
    }
  }

  void _inputEmail() {
    stdout.writeln('Digite seu Email:');
    final email = stdin.readLineSync();
    if (_userValidations.validateEmail(email)) {
      _userData['email'] = email;
      _inputPhone();
    } else {
      stderr.writeln('Email inválido! Tente novamente');
      _inputEmail();
    }
  }

  void _inputPhone() {
    stdout.writeln('Digite seu telefone:');
    final phone = stdin.readLineSync();
    if (_userValidations.validatePhone(phone)) {
      _userData['phone'] = phone;
      _inputCpf();
    } else {
      stderr.writeln('Telefone inválido! Tente novamente');
      _inputPhone();
    }
  }

  void _inputCpf() {
    stdout.writeln('Digite seu CPF:');
    final cpf = stdin.readLineSync();
    if (_userValidations.validateCpf(cpf)) {
      _userData['cpf'] = cpf;
      _inputPassword();
    } else {
      stderr.writeln('CPF inválido! Tente novamente');
      _inputCpf();
    }
  }

  void _inputPassword() {
    stdout.writeln('Digite sua senha:');
    final password = stdin.readLineSync();
    if (_userValidations.validatePassword(password)) {
      _userData['password'] = password;
      _inputCep();
    } else {
      stderr.writeln('Senha inválida! Tente novamente');
      _inputPassword();
    }
  }

  void _inputCep() {
    stdout.writeln('--DIGITE SEU ENDEREÇO--');
    stdout.writeln('Digite seu CEP:');
    final cep = stdin.readLineSync();
    if (cep!.isNotEmpty) {
      _userData['cep'] = cep;
      _inputStreet();
    } else {
      stderr.writeln('CEP inválido! Tente novamente');
      _inputCep();
    }
  }

  void _inputStreet() {
    stdout.writeln('Digite sua rua:');
    final street = stdin.readLineSync();
    if (street!.isNotEmpty) {
      _userData['street'] = street;
      _inputDistrict();
    } else {
      stderr.writeln('Rua inválida! Tente novamente');
      _inputStreet();
    }
  }

  void _inputDistrict() {
    stdout.writeln('Digite seu bairro:');
    final district = stdin.readLineSync();
    if (district!.isNotEmpty) {
      _userData['district'] = district;
      _inputCity();
    } else {
      stderr.writeln('Bairro inválido! Tente novamente');
      _inputDistrict();
    }
  }

  void _inputCity() {
    stdout.writeln('Digite sua cidade:');
    final city = stdin.readLineSync();
    if (city!.isNotEmpty) {
      _userData['city'] = city;
      _inputState();
    } else {
      stderr.writeln('Cidade inválida! Tente novamente');
      _inputCity();
    }
  }

  void _inputState() {
    stdout.writeln('Digite seu estado:');
    final state = stdin.readLineSync();
    if (state!.isNotEmpty) {
      _userData['state'] = state;
      _inputNumber();
    } else {
      stderr.writeln('Estado inválido! Tente novamente');
      _inputState();
    }
  }

  void _inputNumber() {
    stdout.writeln('Digite o número da sua residência:');
    final number = stdin.readLineSync();
    if (number!.isNotEmpty) {
      _userData['number'] = number;
      _inputComplement();
    } else {
      stderr.writeln('Número inválido! Tente novamente');
      _inputNumber();
    }
  }

  void _inputComplement() {
    stdout.writeln('Digite o complemento (opcional):');
    final complement = stdin.readLineSync();
    if (complement!.isNotEmpty) {
      _userData['complement'] = complement;
      _inputMontlyIncome();
    } else if (complement.isEmpty) {
      _userData['complement'] = null;
      _inputMontlyIncome();
    }
  }

  void _inputMontlyIncome() {
    stdout.writeln('Digite sua renda mensal (opcional):');
    final montlyIncome = stdin.readLineSync();
    if (montlyIncome!.isEmpty) {
      _userData['montlyIncome'] = null;
    } else if (_userValidations.validateMontlyIncome(montlyIncome)) {
      _userData['montlyIncome'] = double.tryParse(montlyIncome);
    } else {
      stderr.writeln('Número inválido! Tente novamente');
      _inputMontlyIncome();
    }
  }
}
