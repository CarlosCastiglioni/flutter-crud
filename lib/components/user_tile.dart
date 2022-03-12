import 'package:flutter/material.dart';
import 'package:flutter_crud/components/delete_confirmation_dialog.dart';

class UserTile extends StatefulWidget {
  const UserTile(
      {Key? key, required this.title, required this.id, required this.email})
      : super(key: key);

  final String title;
  final String id;
  final String email;

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text(widget.title),
      subtitle: Text("ID:\n${widget.id}\nEmail:\n${widget.email}"),
      trailing: IconButton(
          onPressed: () async {
            showDialog(
                context: context,
                builder: (_) => DeleteConfirmationDialog(
                      id: widget.id,
                    ));
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          )),
    );
  }
}
