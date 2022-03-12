import 'package:flutter/material.dart';
import 'package:flutter_crud/components/new_user_dialog.dart';
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
    controller.getUsers().then((value) {
      if (controller.unlogged == true) {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.getUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: TextButton(
                    onPressed: () {
                      controller.logout();
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                    child: const Text(
                      "Sair",
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    )),
              ),
              const Text(
                "Lista de usuários",
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                showDialog(
                    context: context, builder: (_) => const NewUserDialog());
              },
              child: const Text(
                "+ Novo Usuário",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            )
          ],
        ),
        body: Observer(
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (context, i) => UserTile(
                  title: controller.users.elementAt(i).name,
                  id: controller.users.elementAt(i).id,
                  email: controller.users.elementAt(i).email,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
