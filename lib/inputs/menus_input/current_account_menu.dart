import 'dart:io';
import 'package:bank_challenge/inputs/menus_input/iaccount_menu.dart';
import 'package:bank_challenge/models/cards/card_model.dart';
import '../input_messages.dart';

class CurrentAccountMenuInput extends IAccountMenuInput {
  CurrentAccountMenuInput({required super.account});

  @override
  void startMenu() {
    InputMessages.currentAccountCreatedMessage();
    stdout.writeln('Escolha uma opção do menu:');
    stdout.writeln('1 - Sacar');
    stdout.writeln('2 - Depositar');
    stdout.writeln('3 - Pedir Empréstimo');
    stdout.writeln('4 - Pagar com cartão de débito');
    stdout.writeln('5 - Pagar com cartão de crédito');
    stdout.writeln('6 - Exibir Dados Pessoais');
    stdout.writeln('7 - Exibir dados da Conta e Cartão');
    final option = stdin.readLineSync();

    if (option == '1') {
      super.inputWithdraw();
    } else if (option == '2') {
      super.inputDeposit();
    } else if (option == '3') {
      _inputApplyForLoan();
    } else if (option == '4') {
      super.payWithDebitCard();
    } else if (option == '5') {
      _payWithDebitAndCreditCard();
    } else if (option == '6') {
      super.showUserDetails();
    } else if (option == '7') {
      super.showAccountDetails();
    } else {
      stderr.writeln('Opção inválida! Tente Novamente');
      startMenu();
    }
  }

  void _inputApplyForLoan() {
    if (account.user.monthlyIncome == null) {
      stderr.writeln(
          'Desculpe, renda mensal não foi fornecida. Empréstimo indisponível');
      startMenu();
    } else {
      _applyForLoan();
    }
  }

  void _applyForLoan() {
    final seventyPerCent = account.user.monthlyIncome! * 0.7;
    final twentyPerCent = account.user.monthlyIncome! * 0.2;
    stdout.writeln(
        'Digite o valor que deseja fazer empréstimo entre $twentyPerCent a $seventyPerCent:');
    final valueString = stdin.readLineSync();
    final value = double.parse(valueString!);

    if (accountValidations.validateApplyForLoan(
        valueString, account.user.monthlyIncome!)) {
      account.applyForLoan(value);
      stdout.writeln(
          'Operação efetuada com sucesso!. Você realizou um empréstimo de R\$$value');
      stdout.writeln('Saldo atual: R\$${account.balance}');
      super.comeBackToMenu();
    } else {
      stderr.writeln('Valor inválido! Tente novamente');
      _inputApplyForLoan();
    }
  }

  void _inputPayWithDebitAndCreditCard() {
    if (account.cardType == CardType.DebitAndCreditCard) {
      _payWithDebitAndCreditCard();
    } else {
      stderr.writeln('Desculpe, essa conta tem apenas cartão de débito!');
      startMenu();
    }
  }

  void _payWithDebitAndCreditCard() {
    stdout.writeln('Digite o valor que deseja pagar com o cartão de crédito:');
    final valueString = stdin.readLineSync();
    final value = double.tryParse(valueString!);

    if (!cardValidations.validateBuyWithCard(valueString)) {
      stderr.writeln('Valor inválido! Tente novamente');
      _payWithDebitAndCreditCard();
    } else if (!cardValidations.acceptBuyWithCard(value!, account.card.limit)) {
      stderr.writeln('Operação cancelada! Saldo inválido para essa operação');
      stdout.writeln(
          'Limite atual do cartão de crédito: R\$${account.card.limit}');
      stdout.writeln('Fatura cartão de crédito: R\$${account.card.amoutSpent}');
      _payWithDebitAndCreditCard();
    } else {
      if (super.requiredPassword()) {
        account.card.buyWithCredit(value);
        stdout.writeln(
            'Operação efetuada com sucesso!. Você pagou R\$$value com cartão de crédito');
        stdout.writeln(
            'Limite atual do cartão de crédito: R\$${account.card.limit}');
        stdout
            .writeln('Fatura cartão de crédito: R\$${account.card.amoutSpent}');
        super.comeBackToMenu();
      } else {
        stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
        startMenu();
      }
    }
  }
}
