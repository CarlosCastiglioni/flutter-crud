import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

dynamic token;

abstract class _HomeStoreBase with Store {
  Future<dynamic> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.get("token");
    return token;
  }

  Future getUsers() async {
    var url = Uri.parse(
        "https://poc-person-service.herokuapp.com/poc/person-api/v1/person");
    var response = await http.get(
      url,
      headers: {'Authorization': token},
    );
    print(response.body.toString());
  }
}
