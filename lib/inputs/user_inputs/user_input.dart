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

  void createUser() {
    InputMessages.createUserMessage();
    inputName();
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
    ChooseAccount().createAccount(user);
  }

  void inputName() {
    stdout.writeln('Digite seu nome:');
    final input = stdin.readLineSync();
    final isValid = NameValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputName();
    } else {
      name = input!;
      inputEmail();
    }
  }

  void inputEmail() {
    stdout.writeln('Digite seu email:');
    final input = stdin.readLineSync();
    final isValid = EmailValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputEmail();
    } else {
      email = input!;
      inputPassword();
    }
  }

  void inputPassword() {
    stdout.writeln('Digite sua senha de 8 dígitos:');
    final input = stdin.readLineSync();
    final isValid = PasswordValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputPassword();
    } else {
      password = input!;
      inputPhone();
    }
  }

  void inputPhone() {
    stdout.writeln('Digite seu telefone:');
    final input = stdin.readLineSync();
    final isValid = PhoneValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputPhone();
    } else {
      phone = input!;
      inputCpf();
    }
  }

  void inputCpf() {
    stdout.writeln('Digite seu CPF:');
    final input = stdin.readLineSync();
    final isValid = CpfValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputCpf();
    } else {
      cpf = input!;
      inputMontlyIncome();
    }
  }

  void inputMontlyIncome() {
    stdout.writeln('Digite sua renda mensal (opicional):');
    final input = stdin.readLineSync();
    final isValid = MontlyIncomeValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputMontlyIncome();
    } else {
      input!.isEmpty
          ? montlyIncome = null
          : montlyIncome = double.tryParse(input);
      inputStreet();
    }
  }

  void inputStreet() {
    stdout.writeln('Digite sua rua:');
    final input = stdin.readLineSync();
    final isValid = StreetValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputStreet();
    } else {
      street = input!;
      inputNumber();
    }
  }

  void inputNumber() {
    stdout.writeln('Digite o número da sua residência:');
    final input = stdin.readLineSync();
    final isValid = NumberValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputNumber();
    } else {
      number = input!;
      inputComplement();
    }
  }

  void inputComplement() {
    stdout.writeln('Digite o complemento (opcional):');
    final input = stdin.readLineSync();
    final isValid = ComplementValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputComplement();
    } else {
      input!.isEmpty ? complement = null : complement = input;
      inputDistrict();
    }
  }

  void inputDistrict() {
    stdout.writeln('Digite seu bairro:');
    final input = stdin.readLineSync();
    final isValid = DistrictValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputDistrict();
    } else {
      district = input!;
      inputCity();
    }
  }

  void inputCity() {
    stdout.writeln('Digite sua cidade:');
    final input = stdin.readLineSync();
    final isValid = CityValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputCity();
    } else {
      city = input!;
      inputState();
    }
  }

  void inputState() {
    stdout.writeln('Digite a sigla do seu estado:');
    final input = stdin.readLineSync();
    final isValid = StateValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputState();
    } else {
      state = input!;
      inputCep();
    }
  }

  void inputCep() {
    stdout.writeln('Digite seu CEP:');
    final input = stdin.readLineSync();
    final isValid = CepValidation(input).validate();
    if (isValid != null) {
      stderr.writeln(isValid);
      inputCep();
    } else {
      cep = input!;
    }
  }
}
