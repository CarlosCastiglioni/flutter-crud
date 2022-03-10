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
  dynamic token;

  Future<dynamic> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.get("token");
  }

  Future getUsers() async {
    await getToken();
    var url = Uri.parse("$baseUrl/person");
    var response = await http.get(
      url,
      headers: {'Authorization': token},
    );
    var json = response.body;
    var list = jsonDecode(json) as List;
    users = list.map((i) => User.fromJson(i));
    return users;
  }
}
