import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
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
  void initState() {
    super.initState();
    controller.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de usuários"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, i) => UserTile(
              title: controller.users.elementAt(i).name,
              subtitle: controller.users.elementAt(i).email,
            ),
          );
        },
      ),
    );
  }
}
