import 'package:bank_challenge/models/accounts/account_model.dart';
import 'package:bank_challenge/models/cards/debit_card_model.dart';
import '../cards/card_model.dart';

class SavingsAccount extends Account {
  late Card card = DebitCard(user: super.user, flag: '', expirationDate: '');

  SavingsAccount({
    required super.user,
    required super.bank,
  });
}
