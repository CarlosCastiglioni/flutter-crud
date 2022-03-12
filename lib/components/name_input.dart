import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  const NameInput({Key? key, required this.nameController}) : super(key: key);

  final dynamic nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nome"),
      maxLength: 50,
      validator: (name) {
        if (name == null || name.isEmpty) {
          return "Por favor, digite seu nome";
        } else {
          return null;
        }
      },
      controller: nameController,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
