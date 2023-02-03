import 'package:bank_challenge/models/accounts/account_model.dart';
import 'package:bank_challenge/models/cards/card_model.dart';
import 'package:bank_challenge/models/cards/debit_card_model.dart';

class CurrentAccount extends Account {
  late Card card = super.user.montlyIncome.value ?? createDebitCard();

  CurrentAccount({
    required super.user,
    required super.bank,
  });

  DebitCard createDebitCard() {
    return DebitCard(user: super.user, flag: '', expirationDate: '');
  }
}
