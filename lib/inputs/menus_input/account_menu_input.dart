import 'dart:io';
import 'package:bank_challenge/models/accounts/account_model.dart';
import '../../validations/account_validations.dart';
import '../../validations/card_validations.dart';

abstract class AccountMenuInput {
  final Account account;
  final accountValidations = AccountValidations();
  final cardValidations = CardValidations();

  AccountMenuInput({required this.account});

  void startMenu();

  void inputWithdraw() {
    stdout.writeln('Digite o valor que deseja sacar:');
    final valueString = stdin.readLineSync();
    final value = double.tryParse(valueString!);

    if (!accountValidations.validateWithdraw(valueString)) {
      stderr.writeln('Valor inválido! Tente novamente');
      inputWithdraw();
    } else if (!accountValidations.acceptWithdraw(value!, account.balance)) {
      stderr.writeln('Operação cancelada! Saldo inválido para essa operação');
      stdout.writeln('Saldo atual: R\$${account.balance}');
      inputWithdraw();
    } else {
      if (requiredPassword()) {
        account.withdraw(value);
        stdout.writeln('Operação efetuada com sucesso!. Você sacou R\$$value');
        stdout.writeln('Saldo atual: R\$${account.balance}');
        comeBackToMenu();
      } else {
        stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
        Future.delayed(Duration(seconds: 3));
        startMenu();
      }
    }
  }

  void inputDeposit() {
    stdout.writeln('Digite o valor que deseja depositar:');
    final valueString = stdin.readLineSync();
    final value = double.tryParse(valueString!);

    if (!accountValidations.validateDeposit(valueString)) {
      stderr.writeln('Valor inválido! Tente novamente');
      inputDeposit();
    } else if (!accountValidations.acceptDeposit(value!)) {
      stderr.writeln(
          'Operação cancelada! Só é possível depositar no máximo R\$5000.00');
      inputDeposit();
    } else {
      if (requiredPassword()) {
        account.deposit(value);
        stdout.writeln(
            'Operação efetuada com sucesso!. Você depositou R\$$value');
        stdout.writeln('Saldo atual: R\$${account.balance}');
        comeBackToMenu();
      } else {
        stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
        Future.delayed(Duration(seconds: 3));
        startMenu();
      }
    }
  }

  void payWithDebitCard() {
    stdout.writeln('Digite o valor que deseja pagar com o Cartão de Débito:');
    final valueString = stdin.readLineSync();
    final value = double.tryParse(valueString!);

    if (!cardValidations.validateBuyWithCard(valueString)) {
      stderr.writeln('Valor inválido! Tente novamente');
      payWithDebitCard();
    } else if (!cardValidations.acceptBuyWithCard(value!, account.balance)) {
      stderr.writeln('Operação cancelada! Saldo inválido para essa operação');
      stdout.writeln('Saldo atual: R\$${account.balance}');
      payWithDebitCard();
    } else {
      if (requiredPassword()) {
        account.balance = account.card.buyWithDebit(value, account.balance);
        stdout.writeln(
            'Operação efetuada com sucesso!. Você pagou R\$$value com cartão de débito');
        stdout.writeln('Saldo atual: R\$${account.balance}');
        comeBackToMenu();
      } else {
        stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
        Future.delayed(Duration(seconds: 3));
        startMenu();
      }
    }
  }

  void showUserDetails() {
    if (requiredPassword()) {
      print(account.user.toString());
      comeBackToMenu();
    } else {
      stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
      startMenu();
    }
  }

  void showAccountDetails() {
    if (requiredPassword()) {
      print(account.toString());
      print(account.card.toString());
      comeBackToMenu();
    } else {
      stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
      startMenu();
    }
  }

  void verifyAccountBalance() {
    if (requiredPassword()) {
      print('Seu saldo atual é: ${account.balance}');
      comeBackToMenu();
    } else {
      stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
      startMenu();
    }
  }

  void comeBackToMenu() {
    stdout.writeln('Digite 1 para voltar ao Menu Inicial');
    final option = stdin.readLineSync();
    if (option! == '1') {
      startMenu();
    } else {
      comeBackToMenu();
    }
  }

  bool requiredPassword() {
    stdout.writeln('Digite sua senha para continuar:');
    final password = stdin.readLineSync();
    if (password == account.user.password) {
      return true;
    } else {
      return false;
    }
  }
}
