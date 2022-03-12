import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CpfInput extends StatelessWidget {
  const CpfInput({Key? key, required this.cpfController}) : super(key: key);

  final dynamic cpfController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Cpf"),
      validator: (cpf) {
        if (cpf == null || cpf.isEmpty) {
          return "Por favor, digite seu cpf";
        } else if (cpf.length < 14) {
          return "Por favor, digite um cpf válido";
        } else {
          return null;
        }
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CpfInputFormatter()
      ],
      controller: cpfController,
      keyboardType: TextInputType.number,
    );
  }
}
