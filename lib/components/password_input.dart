import 'package:flutter/material.dart';

import 'validators/password_validator.dart';

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
      validator: (name) => PasswordValidator.validate(name),
    );
  }
}
