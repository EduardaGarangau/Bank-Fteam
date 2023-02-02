import 'dart:io';

import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/models/address_model.dart';
import 'package:bank_challenge/models/user_model.dart';

class UserInput {
  final user = User(
    name: '',
    email: '',
    password: '',
    phone: '',
    cpf: '',
    montlyIncome: '',
    address: Address(
      street: '',
      number: '',
      district: '',
      city: '',
      state: '',
      cep: '',
      complement: '',
    ),
  );

  void createUser() {
    InputMessages.createUserMessage();
    inputName();
    stdout.write(user.toString());
  }

  void inputName() {
    stdout.writeln('Digite seu nome:');
    final input = stdin.readLineSync();
    user.setName(input!);
    final isValid = user.name.validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputName();
    } else {
      inputEmail();
    }
  }

  void inputEmail() {
    stdout.writeln('Digite seu email:');
    final input = stdin.readLineSync();
    user.setEmail(input!);
    final isValid = user.email.validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputEmail();
    } else {
      inputPassword();
    }
  }

  void inputPassword() {
    stdout.writeln('Digite sua senha de 8 dígitos:');
    final input = stdin.readLineSync();
    user.setPassword(input!);
    final isValid = user.password.validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputPassword();
    } else {
      inputPhone();
    }
  }

  void inputPhone() {
    stdout.writeln('Digite seu telefone:');
    final input = stdin.readLineSync();
    user.setPhone(input!);
    final isValid = user.phone.validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputPhone();
    } else {
      inputCpf();
    }
  }

  void inputCpf() {
    stdout.writeln('Digite seu CPF:');
    final input = stdin.readLineSync();
    user.setCpf(input!);
    final isValid = user.cpf.validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputCpf();
    } else {
      inputMontlyIncome();
    }
  }

  void inputMontlyIncome() {
    stdout.writeln('Digite sua renda mensal (opicional):');
    final input = stdin.readLineSync();
    user.setMontlyIncome(input!);
    final isValid = user.montlyIncome.validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputMontlyIncome();
    } else {
      inputStreet();
    }
  }

  void inputStreet() {
    stdout.writeln('Digite sua rua:');
    final input = stdin.readLineSync();
    user.address.setStreet(input!);
    final isValid = user.address.street.validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputStreet();
    } else {
      inputNumber();
    }
  }

  void inputNumber() {
    stdout.writeln('Digite o número da sua residência:');
    final input = stdin.readLineSync();
    user.address.setNumber(input!);
    final isValid = user.address.number.validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputNumber();
    } else {
      inputComplement();
    }
  }

  void inputComplement() {
    stdout.writeln('Digite o complemento (opcional):');
    final input = stdin.readLineSync();
    user.address.setComplement(input!);
    final isValid = user.address.complement.validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputComplement();
    } else {
      inputDistrict();
    }
  }

  void inputDistrict() {
    stdout.writeln('Digite seu bairro:');
    final input = stdin.readLineSync();
    user.address.setDistrict(input!);
    final isValid = user.address.district.validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputDistrict();
    } else {
      inputCity();
    }
  }

  void inputCity() {
    stdout.writeln('Digite sua cidade:');
    final input = stdin.readLineSync();
    user.address.setCity(input!);
    final isValid = user.address.city.validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputCity();
    } else {
      inputState();
    }
  }

  void inputState() {
    stdout.writeln('Digite a sigla do seu estado:');
    final input = stdin.readLineSync();
    user.address.setState(input!);
    final isValid = user.address.state.validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputState();
    } else {
      inputCep();
    }
  }

  void inputCep() {
    stdout.writeln('Digite seu CEP:');
    final input = stdin.readLineSync();
    user.address.setCep(input!);
    final isValid = user.address.cep.validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputCep();
    }
  }
}
