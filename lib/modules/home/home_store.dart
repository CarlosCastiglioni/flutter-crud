import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/users.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final baseUrl = "https://poc-person-service.herokuapp.com/poc/person-api/v1";

  @observable
  Iterable<User> users = [];

  @observable
  bool unlogged = false;

  @observable
  dynamic token;

  Future<dynamic> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.get("token");
    if (token == null) {
      unlogged = true;
    }
  }

  Future<bool> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.clear();
    unlogged = true;
    return unlogged;
  }

  Future getUsers() async {
    await getToken();
    var url = Uri.parse("$baseUrl/person");
    var response = await http.get(
      url,
      headers: {'Authorization': token},
    );
    if (response.statusCode == 200) {
      var json = response.body;
      var list = jsonDecode(json) as List;
      users = list.map((i) => User.fromJson(i));

      return users;
    } else {
      logout();
    }
  }

  Future addUsers() async {
    await getToken();
    var url = Uri.parse("$baseUrl/person");
    var response = await http.post(
      url,
      body: jsonEncode({
        'id': "123",
        'name': "Teste6",
        "cpf": "123.123.123-16",
        "email": "teste6@teste.com.br",
        "password": "123",
        "profiles": ["USER"]
      }),
      headers: {'Content-type': 'application/json', 'Authorization': token},
    );
    return response;
  }
}
