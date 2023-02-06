import 'dart:io';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/models/address_model.dart';
import 'package:bank_challenge/models/user_model.dart';
import 'package:bank_challenge/validations/address_validations/complement_validation.dart';
import 'package:bank_challenge/validations/user_validations/cpf_validation.dart';
import 'package:bank_challenge/validations/user_validations/email_validation.dart';
import 'package:bank_challenge/validations/user_validations/name_validation.dart';
import 'package:bank_challenge/validations/user_validations/password_validation.dart';
import '../../validations/address_validations/cep_validation.dart';
import '../../validations/address_validations/city_validation.dart';
import '../../validations/address_validations/district_validation.dart';
import '../../validations/address_validations/number_validation.dart';
import '../../validations/address_validations/state_validation.dart';
import '../../validations/address_validations/street_validation.dart';
import '../../validations/user_validations/montly_income_validation.dart';
import '../../validations/user_validations/phone_validation.dart';
import '../account_inputs/choose_account.dart';

class UserInput {
  late String name;
  late String email;
  late String password;
  late String phone;
  late String cpf;
  double? montlyIncome;
  late String street;
  late String number;
  late String district;
  late String city;
  late String state;
  late String cep;
  String? complement;

  UserModel createUser() {
    InputMessages.createUserMessage();
    _inputName();
    _inputEmail();
    _inputPassword();
    _inputPhone();
    _inputCpf();
    _inputMontlyIncome();
    _inputStreet();
    _inputNumber();
    _inputComplement();
    _inputDistrict();
    _inputCity();
    _inputState();
    _inputCep();
    final user = UserModel(
      name: name,
      email: email,
      password: password,
      phone: phone,
      cpf: cpf,
      montlyIncome: montlyIncome,
      address: AddressModel(
        street: street,
        number: number,
        district: district,
        city: city,
        state: state,
        cep: cep,
        complement: complement,
      ),
    );
    InputMessages.userCreatedMessage();
    return user;
  }

  void _inputName() {
    stdout.writeln('Digite seu nome:');
    final input = stdin.readLineSync();
    final isValid = NameValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputName();
    } else {
      name = input!;
    }
  }

  void _inputEmail() {
    stdout.writeln('Digite seu email:');
    final input = stdin.readLineSync();
    final isValid = EmailValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputEmail();
    } else {
      email = input!;
    }
  }

  void _inputPassword() {
    stdout.writeln('Digite sua senha de 8 dígitos:');
    final input = stdin.readLineSync();
    final isValid = PasswordValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputPassword();
    } else {
      password = input!;
    }
  }

  void _inputPhone() {
    stdout.writeln('Digite seu telefone:');
    final input = stdin.readLineSync();
    final isValid = PhoneValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputPhone();
    } else {
      phone = input!;
    }
  }

  void _inputCpf() {
    stdout.writeln('Digite seu CPF:');
    final input = stdin.readLineSync();
    final isValid = CpfValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputCpf();
    } else {
      cpf = input!;
    }
  }

  void _inputMontlyIncome() {
    stdout.writeln('Digite sua renda mensal (opicional):');
    final input = stdin.readLineSync();
    final isValid = MontlyIncomeValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputMontlyIncome();
    } else {
      input!.isEmpty
          ? montlyIncome = null
          : montlyIncome = double.tryParse(input);
    }
  }

  void _inputStreet() {
    stdout.writeln('Digite sua rua:');
    final input = stdin.readLineSync();
    final isValid = StreetValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputStreet();
    } else {
      street = input!;
    }
  }

  void _inputNumber() {
    stdout.writeln('Digite o número da sua residência:');
    final input = stdin.readLineSync();
    final isValid = NumberValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputNumber();
    } else {
      number = input!;
    }
  }

  void _inputComplement() {
    stdout.writeln('Digite o complemento (opcional):');
    final input = stdin.readLineSync();
    final isValid = ComplementValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputComplement();
    } else {
      input!.isEmpty ? complement = null : complement = input;
    }
  }

  void _inputDistrict() {
    stdout.writeln('Digite seu bairro:');
    final input = stdin.readLineSync();
    final isValid = DistrictValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputDistrict();
    } else {
      district = input!;
    }
  }

  void _inputCity() {
    stdout.writeln('Digite sua cidade:');
    final input = stdin.readLineSync();
    final isValid = CityValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputCity();
    } else {
      city = input!;
    }
  }

  void _inputState() {
    stdout.writeln('Digite a sigla do seu estado:');
    final input = stdin.readLineSync();
    final isValid = StateValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputState();
    } else {
      state = input!;
    }
  }

  void _inputCep() {
    stdout.writeln('Digite seu CEP:');
    final input = stdin.readLineSync();
    final isValid = CepValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      _inputCep();
    } else {
      cep = input!;
    }
  }
}
