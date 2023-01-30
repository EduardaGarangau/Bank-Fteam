import 'package:bank_challenge/inputs/cards_input/card_input.dart';
import 'package:bank_challenge/inputs/input_messages.dart';
import 'package:bank_challenge/models/cards/debit_card_model.dart';

class DebitCardInput extends CardInput {
  DebitCardInput({required super.user});

  DebitCard createDebitCard() {
    InputMessages.createDebitCardMessage();
    super.inputFlag();
    return DebitCard(
      user: user,
      flag: super.cardData['flag'],
      expirationDate: super.cardData['expirationDate'],
    );
  }
}
