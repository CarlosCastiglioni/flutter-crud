import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/modules/home/home_store.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final String id;
  const DeleteConfirmationDialog({Key? key, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = HomeStore();

    return AlertDialog(
      title: const Text("Confirmar exclusão."),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Deseja confirmar a exclusão deste usuário?"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Não"),
                  style: ElevatedButton.styleFrom(primary: Colors.red)),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await controller.deleteUser(id);
                    if (controller.unlogged == false) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/home", (route) => false);
                      BotToast.showText(text: controller.message);
                    } else {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/login", (route) => false);
                      BotToast.showText(text: controller.message);
                    }
                  },
                  child: const Text("Sim"),
                  style: ElevatedButton.styleFrom(primary: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }
}
