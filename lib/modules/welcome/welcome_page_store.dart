import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'welcome_page_store.g.dart';

class WelcomePageStore = _WelcomePageStoreBase with _$WelcomePageStore;

abstract class _WelcomePageStoreBase with Store {
  Future<bool> verifyToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.get("token") != null) {
      return true;
    } else {
      return false;
    }
  }
}
