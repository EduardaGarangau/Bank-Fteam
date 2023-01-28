import 'package:bank_challenge/inputs/account_inputs/choose_account_input.dart';
import 'package:bank_challenge/inputs/user_inputs/user_input.dart';

class Input {
  void startInput() {
    final user = UserInput().createUser();
    ChooseAccountInput().chooseInput(user);
  }
}
