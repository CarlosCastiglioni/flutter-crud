import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../modules/home/home_store.dart';

class UserTile extends StatefulWidget {
  const UserTile({Key? key, required this.title, required this.id})
      : super(key: key);

  final title;
  final id;

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    final controller = HomeStore();
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(widget.title),
      subtitle: Text(widget.id),
      trailing: SizedBox(
        width: 100,
        child: IconButton(
            onPressed: () async {
              await controller.deleteUser(widget.id);
              if (controller.unlogged == false) {
                Navigator.pushReplacementNamed(context, "/home");
                BotToast.showText(text: controller.message);
              } else {
                Navigator.pushReplacementNamed(context, "/login");
                BotToast.showText(text: controller.message);
              }
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ),
    );
  }
}
