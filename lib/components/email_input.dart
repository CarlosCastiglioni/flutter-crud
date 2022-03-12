import 'package:flutter/material.dart';

import 'validators/email_validator.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key, required this.emailController, this.maxLength})
      : super(key: key);

  final dynamic emailController;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: "E-mail"),
      maxLength: maxLength,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (email) => EmailValidator.validate(email, emailController),
    );
  }
}
