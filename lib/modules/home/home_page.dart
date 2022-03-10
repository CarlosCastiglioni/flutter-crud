import 'package:flutter/material.dart';
import 'package:flutter_crud/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          controller.getUsers();
        },
        child: Text("Get Todos Usuários"),
      )),
    );
  }
}
