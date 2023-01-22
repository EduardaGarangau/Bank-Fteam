import 'package:bank_challenge/models/cards/card_model.dart';

class DebitCard extends Card {
  DebitCard({
    required super.userName,
  }) {
    limit = Exception('Operação suportada, apenas para Cartão de Crédito');
    amoutSpent = Exception('Operação suportada, apenas para Cartão de Crédito');
  }

  @override
  void buyWithCreditCard(double value) {
    throw Exception('Operação suportada apenas para Cartão de Crédito');
  }
}
