import 'package:bot_toast/bot_toast.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_crud/modules/home/home_store.dart';

class NewUserDialog extends StatefulWidget {
  const NewUserDialog({Key? key}) : super(key: key);

  @override
  State<NewUserDialog> createState() => _NewUserDialogState();
}

class _NewUserDialogState extends State<NewUserDialog> {
  final _formKey = GlobalKey<FormState>();
  final homeController = HomeStore();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpfController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Cadastrar novo usuário"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Nome"),
              maxLength: 50,
              validator: (name) {
                if (name == null || name.isEmpty) {
                  return "Por favor, digite seu nome";
                } else {
                  return null;
                }
              },
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
                } else {
                  return null;
                }
              },
              controller: _passwordController,
              keyboardType: TextInputType.text,
            ),
            TextFormField(
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
              controller: _cpfController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar"),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () async {
                      homeController.cpf = _cpfController.text;
                      homeController.name = _nameController.text;
                      homeController.email = _emailController.text;
                      homeController.password = _cpfController.text;
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (_formKey.currentState!.validate()) {
                        final worked = await homeController.addUsers();
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        if (worked) {
                          BotToast.showText(
                              text: "Usuário cadastrado com sucesso!");
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/home", (route) => false);
                        } else {
                          BotToast.showText(text: "E-mail ou Cpf já existem!");
                        }
                      }
                    },
                    child: const Text("Enviar"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
