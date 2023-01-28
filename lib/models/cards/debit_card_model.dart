import 'package:bank_challenge/models/cards/card_model.dart';

class DebitCard extends Card {
  DebitCard({
    required super.userName,
    required super.flag,
    required super.expirationDate,
  });

  @override
  void buyWithCreditCard(double value) {
    throw Exception('Operação suportada apenas para Cartão de Crédito');
  }

  @override
  String toString() {
    return '| CARTÃO DE DÉBITO |\nNome: $userName\nNumero: ${super.number}\nCVV: ${super.cvv}\nBandeira: $flag\nData de Valiade: $expirationDate';
  }
}
