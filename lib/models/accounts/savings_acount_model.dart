import 'package:bank_challenge/models/accounts/account_model.dart';

class SavingsAccount extends Account {
  SavingsAccount({
    required super.user,
    required super.bank,
    required super.card,
  });

  @override
  void renderBalance(int days) {
    final halfDays = days / 2;
    final doubleDays = days * 2;
    final totalInDays = (super.balance * 0.02) * days;
    final totalInHalfDays = (super.balance * 0.02) * halfDays;
    final totalInDoubleDays = (super.balance * 0.02) * doubleDays;
    print('Em $days dias seu dinheiro renderá: $totalInDays');
    print('Em $halfDays dias seu dinheiro renderá: $totalInHalfDays');
    print('Em $doubleDays dias seu dinheiro renderá: $totalInDoubleDays');
  }

  @override
  void applyForLoan(double value) {}

  @override
  String toString() {
    return '| DADOS CONTA POUPANÇA |\nNumero: ${super.number}\nAgencia: ${super.agency}\nBanco: ${super.bank}\nSaldo: ${super.balance}';
  }
}
