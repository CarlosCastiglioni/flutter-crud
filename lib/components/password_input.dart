import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key, required this.passwordController})
      : super(key: key);

  final dynamic passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      maxLength: 10,
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
