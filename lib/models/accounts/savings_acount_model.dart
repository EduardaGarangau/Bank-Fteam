import 'package:bank_challenge/models/accounts/account_model.dart';
import 'package:meta/meta.dart';

class SavingsAccount extends Account {
  SavingsAccount({
    required super.user,
    required super.bank,
    required super.card,
  });

  @visibleForTesting
  void renderSavings() {}

  @override
  String toString() {
    return '| DADOS CONTA POUPANÇA |\nNumero: ${super.number}\nAgencia: ${super.agency}\nBanco: ${super.bank}\nSaldo: ${super.balance}';
  }
}
