import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'validators/cpf_validator.dart';

class CpfInput extends StatelessWidget {
  const CpfInput({Key? key, required this.cpfController}) : super(key: key);

  final dynamic cpfController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Cpf"),
      validator: (name) => CpfValidator.validate(name),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CpfInputFormatter()
      ],
      controller: cpfController,
      keyboardType: TextInputType.number,
    );
  }
}
