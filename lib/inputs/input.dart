import 'package:bank_challenge/inputs/account_inputs/choose_account.dart';
import 'package:bank_challenge/inputs/menu_inputs/current_account_menu_input.dart';
import 'package:bank_challenge/inputs/menu_inputs/savings_account_menu_input.dart';
import 'package:bank_challenge/inputs/user_inputs/user_input.dart';
import 'package:bank_challenge/models/accounts/current_acount_model.dart';
import 'package:bank_challenge/models/accounts/savings_acount_model.dart';

class Input {
  static void startInput() {
    final user = UserInput().createUser();
    final account = ChooseAccount().createAccount(user);
    if (account is SavingsAccountModel) {
      SavingsAccountMenuInput(account).startMenu();
    } else if (account is CurrentAccountModel) {
      CurrentAccountMenuInput(account).startMenu();
    }
  }
}
