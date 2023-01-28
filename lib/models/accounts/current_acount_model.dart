import 'package:bank_challenge/models/accounts/account_model.dart';

class CurrentAccount extends Account {
  CurrentAccount({
    required super.user,
    required super.bank,
    required super.card,
  });

  void applyForLoan(double value) {
    balance += value;
  }

  @override
  String toString() {
    return '| DADOS CONTA CORRENTE |\nNumero: ${super.number}\nAgencia: ${super.agency}\nBanco: ${super.bank}\nSaldo: ${super.balance}';
  }
}
