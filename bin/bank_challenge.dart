import 'dart:async';
import 'dart:math';
import 'package:bank_challenge/bank_challenge.dart' as bank_challenge;
import 'package:bank_challenge/models/accounts/account_model.dart';
import 'package:bank_challenge/models/accounts/current_acount_model.dart';
import 'package:bank_challenge/models/accounts/savings_acount_model.dart';
import 'dart:io';

import 'package:bank_challenge/models/address_model.dart';
import 'package:bank_challenge/models/cards/card_model.dart';
import 'package:bank_challenge/models/cards/debit_and_credit_card_model.dart';
import 'package:bank_challenge/models/cards/debit_card_model.dart';
import 'package:bank_challenge/models/user_model.dart';

void main(List<String> arguments) {
  final user = User(
    name: 'Eduarda',
    email: 'eduardagarangau98@gmail.com',
    phone: '41996717016',
    password: '12345678',
    cpf: '08591413903',
    monthlyIncome: 3500,
    address: Address(
      street: 'Rua José Mario de Oliveira',
      cep: '82520550',
      city: 'Curitiba',
      district: 'Bacacheri',
      number: '216',
      state: 'Paraná',
      complement: 'Sobrado 3',
    ),
  );

  final account = CurrentAccount(
    user: user,
    bank: 'Banco do Brasil',
    balance: 7000,
    cardType: CardType.debitAndCredit,
  );

  account.applyForLoan(1000);
  print('Saldo após emprestimo: ${account.balance}');
  account.card.buyWithCreditCard(100);
  print('Limite do cartão após compra: ${account.card.limit}');
  print('Valor gasto no cartão: ${account.card.amoutSpent}');
}
