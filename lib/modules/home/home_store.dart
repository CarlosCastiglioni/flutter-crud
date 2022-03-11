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
  String email = "", password = "", cpf = "", name = "";

  @observable
  Iterable<User> users = [];

  @observable
  bool unlogged = false;

  @observable
  String message = "";

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

  Future deleteUser(String id) async {
    await getToken();
    var url = Uri.parse("$baseUrl/person/$id");
    var response = await http.delete(
      url,
      headers: {'Authorization': token},
    );
    if (response.statusCode == 200) {
      message = "Usuário deletado com sucesso!";
    } else {
      message = "Não é permitido deletar este usuário!";
    }
  }

  Future<bool> addUsers() async {
    await getToken();
    var url = Uri.parse("$baseUrl/person");
    var response = await http.post(
      url,
      body: jsonEncode({
        "name": name,
        "cpf": cpf,
        "email": email,
        "password": password,
        "profiles": ["USER"]
      }),
      headers: {'Content-type': 'application/json', 'Authorization': token},
    );
    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 422) {
      return false;
    } else {
      return false;
    }
  }
}
