import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () async {
          var url = Uri.parse(
              "https://poc-person-service.herokuapp.com/poc/person-api/v1/person");
          var response = await http.get(
            url,
            headers: {
              'Authorization':
                  'Bearer eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJQRVJTT04iLCJzdWIiOiJhbnlTdWJqZWN0IiwidXNlcm5hbWUiOiJkZXYwMDFAbWFpbC5jb20uYnIiLCJpYXQiOjE2NDY5MTc2NzUsImV4cCI6MTY0NjkxODI3NX0.A9uN4ZkU3bLETaKCRKDXEfH_knZ02qA6S1oTQFipbO4'
            },
          );
          print(response.body.toString());
        },
        child: Text("Botao Get"),
      )),
    );
  }
}
