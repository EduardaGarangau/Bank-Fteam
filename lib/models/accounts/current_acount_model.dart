import 'package:bank_challenge/models/accounts/account_model.dart';

class CurrentAccount extends Account {
  CurrentAccount({
    required super.user,
    required super.bank,
    required super.card,
    required super.cardType,
  });

  @override
  void applyForLoan(double value) {
    balance += value;
  }

  @override
  void renderBalance(int days) {}

  @override
  String toString() {
    return '| DADOS CONTA CORRENTE |\nNumero: ${super.number}\nAgencia: ${super.agency}\nBanco: ${super.bank}\nSaldo: ${super.balance}';
  }
}
