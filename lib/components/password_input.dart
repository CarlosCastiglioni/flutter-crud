import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput(
      {Key? key, required this.passwordController, this.maxLength})
      : super(key: key);

  final dynamic passwordController;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      maxLength: maxLength,
      decoration: const InputDecoration(labelText: "Senha"),
      controller: passwordController,
      keyboardType: TextInputType.text,
      validator: (password) {
        if (password == null || password.isEmpty) {
          return "Por favor, digite sua senha";
        }
        return null;
      },
    );
  }
}
