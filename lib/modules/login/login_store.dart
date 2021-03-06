import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/base_url.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

@observable
String username = '', password = '';

abstract class _LoginStoreBase with Store {
  Future<bool> login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse("$baseUrl/authenticates/login");
    var response = await http.post(url,
        body: jsonEncode({'username': username, 'password': password}),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });
    if (response.statusCode == 200) {
      var token = (jsonDecode(response.body)["token"]);
      await sharedPreferences.setString("token", "{Bearer $token");
      return true;
    } else {
      return false;
    }
  }
}
