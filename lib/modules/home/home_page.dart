import 'dart:async';

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
  Timer? _rootTimer;

  @override
  void initState() {
    super.initState();
    controller.getUsers().then((value) {
      if (controller.unlogged == true) {
        Navigator.pushReplacementNamed(context, "/login");
      }
      if (_rootTimer == null) {
        const time = Duration(minutes: 5);
        _rootTimer = Timer(time, () {
          Navigator.pushNamedAndRemoveUntil(
              context, "/login", (route) => false);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.getUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Lista de usuários",
            ),
          ),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (_) => const NewUserDialog());
                    },
                    icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: () {
                      controller.logout();
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                    icon: const Icon(Icons.logout_outlined)),
              ],
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
