import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_crud/modules/login/login_store.dart';

class NewUserDialog extends StatefulWidget {
  const NewUserDialog({Key? key}) : super(key: key);

  @override
  State<NewUserDialog> createState() => _NewUserDialogState();
}

class _NewUserDialogState extends State<NewUserDialog> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpfController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Cadastrar novo usuário"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Nome"),
            maxLength: 50,
            controller: _nameController,
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "E-mail"),
            maxLength: 20,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (email) {
              if (email == null || email.isEmpty) {
                return "Por favor, digite seu e-mail";
              } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(_emailController.text)) {
                return 'Por favor, digite um e-mail correto';
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(labelText: "Senha"),
            maxLength: 10,
            validator: (password) {
              if (password == null || password.isEmpty) {
                return "Por favor, digite sua senha";
              }
            },
            controller: _passwordController,
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Cpf"),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter()
            ],
            controller: _cpfController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {},
                  child: Text("Cancelar"),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {},
                  child: Text("Enviar"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
