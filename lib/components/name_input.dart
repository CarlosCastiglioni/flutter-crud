import 'package:flutter/material.dart';
import 'package:flutter_crud/components/validators/name_validator.dart';

class NameInput extends StatelessWidget {
  const NameInput({Key? key, required this.nameController}) : super(key: key);

  final dynamic nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nome"),
      maxLength: 50,
      validator: (name) => NameValidator.validate(name),
      controller: nameController,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
