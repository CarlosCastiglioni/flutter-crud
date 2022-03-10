import 'package:flutter/material.dart';
import 'package:flutter_crud/modules/home/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Observer(
              builder: (_) {
                return ElevatedButton(
                  onPressed: () {
                    controller.getUsers();
                  },
                  child: const Text("Get Todos Usuários"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
