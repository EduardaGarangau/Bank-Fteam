import 'dart:io';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/models/accounts/account_model.dart';
import 'package:bank_challenge/models/cards/debit_and_credit_card_model.dart';
import '../../validations/account_validations/days_validation.dart';
import '../../validations/account_validations/value_methods_validation.dart';
import '../../validations/card_validations/value_pay_validation.dart';

abstract class MenuInput {
  final AccountModel account;

  MenuInput(this.account);

  void startMenu();

  void inputDeposit() {
    stdout.writeln('Digite o valor que deseja depositar:');
    final input = stdin.readLineSync();
    final isValid = ValueMethodsValidation(input).validate();
    if (isValid == null) {
      if (requiredPassword()) {
        final depositValue = double.tryParse(input!);
        final deposit = account.deposit(depositValue!);
        deposit == null
            ? stdout.writeln(
                'Deposito realizado com sucesso. Seu saldo é: ${account.balance}')
            : stderr.writeln(deposit);
        comeBackToMenu();
      } else {
        stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
        comeBackToMenu();
      }
    } else {
      stderr.writeln(isValid);
      inputDeposit();
    }
  }

  void inputWithdraw() {
    stdout.writeln('Digite o valor que deseja sacar:');
    final input = stdin.readLineSync();
    final isValid = ValueMethodsValidation(input).validate();
    if (isValid == null) {
      if (requiredPassword()) {
        final withdrawValue = double.tryParse(input!);
        final withdraw = account.withdraw(withdrawValue!);
        withdraw == null
            ? stdout.writeln(
                'Saque realizado com sucesso. Seu saldo é: ${account.balance}')
            : stderr.writeln(withdraw);
        comeBackToMenu();
      } else {
        stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
        comeBackToMenu();
      }
    } else {
      stderr.writeln(isValid);
      inputWithdraw();
    }
  }

  void inputPayWithDebitCard() {
    stdout.writeln('Digite o valor que deseja pagar com Cartão de Débito:');
    final input = stdin.readLineSync();
    final isValid = ValuePayValidation(input).validate();
    if (isValid == null) {
      if (requiredPassword()) {
        final payValue = double.tryParse(input!);
        final pay = account.card.buyWithDebit(payValue!, account.balance);
        if (pay == null) {
          stderr.writeln('Valor excedeu limite da conta. Operação cancelada!');
          comeBackToMenu();
        } else {
          account.balance = pay;
          stdout.writeln(
              'Pagamento realizado com sucesso! Seu saldo atual é ${account.balance}');
          comeBackToMenu();
        }
      } else {
        stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
        comeBackToMenu();
      }
    } else {
      stderr.writeln(isValid);
      inputPayWithDebitCard();
    }
  }

  void inputPayWithCreditCard() {
    stdout.writeln('Digite o valor que deseja pagar com Cartão de Crédito:');
    final input = stdin.readLineSync();
    final isValid = ValuePayValidation(input).validate();
    if (isValid == null) {
      if (requiredPassword()) {
        final payValue = double.tryParse(input!);
        final pay = account.card.buyWithCreditCard(payValue!);
        pay == null
            ? stdout.writeln(
                'Pagamento realizado com sucesso! Sua fatura é ${account.card.amountSpend}')
            : stderr.writeln(pay);
        comeBackToMenu();
      } else {
        stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
        comeBackToMenu();
      }
    } else {
      stderr.writeln(isValid);
      inputPayWithDebitCard();
    }
  }

  void renderBalance() {
    stdout.writeln('Digite o número de dias que deseja simular:');
    final input = stdin.readLineSync();
    final isValid = DaysValidation(input).validate();
    if (isValid == null) {
      if (requiredPassword()) {
        final days = int.tryParse(input!);
        account.renderBalance(days!);
        comeBackToMenu();
      } else {
        stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
        comeBackToMenu();
      }
    } else {
      stderr.writeln(isValid);
      renderBalance();
    }
  }

  void inputApplyForLoan() {
    stdout.writeln('Digite o valor que deseja fazer empréstimo:');
    final input = stdin.readLineSync();
    final isValid = ValueMethodsValidation(input).validate();
    if (isValid == null) {
      if (requiredPassword()) {
        final loanValue = double.tryParse(input!);
        final loan = account.loan(loanValue!);
        loan == null
            ? stdout.writeln(
                'Empréstimo aprovado. Seu saldo atual é: ${account.balance}')
            : stderr.writeln(loan);
        comeBackToMenu();
      } else {
        stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
        comeBackToMenu();
      }
    } else {
      stderr.writeln(isValid);
      inputApplyForLoan();
    }
  }

  void showUserDetails() {
    InputMessages.userDetailsTitle();
    stdout.writeln(account.user.toString());
    comeBackToMenu();
  }

  void showAccountDetails() {
    InputMessages.accountDetailsTitle();
    stdout.writeln(account.toString());
    comeBackToMenu();
  }

  void showCardDetails() {
    InputMessages.cardDetailsTitle();
    stdout.writeln(account.card.toString());
    if (!account.cardIsDebit) {
      stdout.writeln(
          '\nLimite: ${account.card}\nFatura: ${account.card.amountSpend}');
    }
    comeBackToMenu();
  }

  void comeBackToMenu() {
    stdout.writeln('Aperte Enter para voltar ao Menu Principal');
    final input = stdin.readLineSync();
    if (input!.isEmpty) {
      startMenu();
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
