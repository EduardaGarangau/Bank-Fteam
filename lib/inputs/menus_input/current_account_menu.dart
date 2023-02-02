import 'dart:io';
import 'package:bank_challenge/inputs/menus_input/account_menu_input.dart';
import 'package:bank_challenge/models/cards/card_model.dart';
import '../input_messages.dart';

// class CurrentAccountMenuInput extends AccountMenuInput {
//   CurrentAccountMenuInput({required super.account});

//   @override
//   void startMenu() {
//     InputMessages.currentAccountMenuTitle();
//     stdout.writeln('Escolha uma opção do menu:');
//     stdout.writeln('1 - Verificar saldo atual');
//     stdout.writeln('2 - Sacar');
//     stdout.writeln('3 - Depositar');
//     stdout.writeln('4 - Pedir Empréstimo');
//     stdout.writeln('5 - Pagar com Cartão de Débito');
//     stdout.writeln('6 - Pagar com Cartão de Crédito');
//     stdout.writeln('7 - Exibir Dados Pessoais');
//     stdout.writeln('8 - Exibir dados da Conta e Cartão');
//     final option = stdin.readLineSync();

//     if (option == '1') {
//       super.verifyAccountBalance();
//     } else if (option == '2') {
//       super.inputWithdraw();
//     } else if (option == '3') {
//       super.inputDeposit();
//     } else if (option == '4') {
//       _inputApplyForLoan();
//     } else if (option == '5') {
//       super.payWithDebitCard();
//     } else if (option == '6') {
//       _inputPayWithDebitAndCreditCard();
//     } else if (option == '7') {
//       super.showUserDetails();
//     } else if (option == '8') {
//       super.showAccountDetails();
//     } else {
//       stderr.writeln('Opção inválida! Tente Novamente');
//       startMenu();
//     }
//   }

//   void _inputApplyForLoan() {
//     if (account.user.monthlyIncome == null) {
//       stderr.writeln(
//           'Desculpe, empréstimo indisponível. Renda mensal não foi fornecida');
//       startMenu();
//     } else {
//       _applyForLoan();
//     }
//   }

//   void _applyForLoan() {
//     final seventyPerCent = account.user.monthlyIncome! * 0.7;
//     final twentyPerCent = account.user.monthlyIncome! * 0.2;
//     stdout.writeln(
//         'Digite o valor que deseja fazer empréstimo entre $twentyPerCent a $seventyPerCent:');
//     final valueString = stdin.readLineSync();
//     final value = double.parse(valueString!);

//     if (accountValidations.validateApplyForLoan(
//         valueString, account.user.monthlyIncome!)) {
//       if (requiredPassword()) {
//         account.applyForLoan(value);
//         stdout.writeln(
//             'Operação efetuada com sucesso!. Você realizou um empréstimo de R\$$value');
//         stdout.writeln('Saldo atual: R\$${account.balance}');
//         super.comeBackToMenu();
//       } else {
//         stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
//         Future.delayed(Duration(seconds: 3));
//         startMenu();
//       }
//     } else {
//       stderr.writeln('Valor inválido! Tente novamente');
//       _inputApplyForLoan();
//     }
//   }

//   void _inputPayWithDebitAndCreditCard() {
//     if (account.cardType == CardType.DebitAndCreditCard) {
//       _payWithDebitAndCreditCard();
//     } else {
//       stderr.writeln('Desculpe, essa conta tem apenas Cartão de Débito!');
//       startMenu();
//     }
//   }

//   void _payWithDebitAndCreditCard() {
//     stdout.writeln('Digite o valor que deseja pagar com o Cartão de Crédito:');
//     final valueString = stdin.readLineSync();
//     final value = double.tryParse(valueString!);

//     if (!cardValidations.validateBuyWithCard(valueString)) {
//       stderr.writeln('Valor inválido! Tente novamente');
//       _payWithDebitAndCreditCard();
//     } else if (!cardValidations.acceptBuyWithCard(value!, account.card.limit)) {
//       stderr.writeln('Operação cancelada! Saldo inválido para essa operação');
//       stdout.writeln(
//           'Limite atual do Cartão de Crédito: R\$${account.card.limit}');
//       stdout.writeln(
//           'Fatura do Cartão de Crédito: R\$${account.card.amoutSpent}');
//       _payWithDebitAndCreditCard();
//     } else {
//       if (super.requiredPassword()) {
//         account.card.buyWithCredit(value);
//         stdout.writeln(
//             'Operação efetuada com sucesso!. Você pagou R\$$value com Cartão de Crédito');
//         stdout.writeln(
//             'Limite atual do Cartão de Crédito: R\$${account.card.limit}');
//         stdout
//             .writeln('Fatura Cartão de Crédito: R\$${account.card.amoutSpent}');
//         super.comeBackToMenu();
//       } else {
//         stderr.writeln('Senha incorreta! Voltando ao Menu Inicial');
//         Future.delayed(Duration(seconds: 3));
//         startMenu();
//       }
//     }
//   }
// }
