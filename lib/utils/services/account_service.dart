import 'package:ps_welness_new_ui/utils/models/account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountService {
  static const String _accountKey = 'accountData';
  Future<AccountModel?> get getAccountData async {
    final SharedPreferences getStorage = await SharedPreferences.getInstance();

    final String? accountDataEncoded = getStorage.get(_accountKey) as String?;
    if (accountDataEncoded == null) {
      return null;
    }
    return accountModelFromJson(accountDataEncoded);
  }

  Future<void> setAccountData(AccountModel? accountData) async {
    final SharedPreferences getStorage = await SharedPreferences.getInstance();

    print("WHILE SET ACCOUNT $accountData");
    getStorage.setString(_accountKey, accountModelToJson(accountData!));
  }
}

final accountService = AccountService();
