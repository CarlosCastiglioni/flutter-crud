import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/components/cpf_input.dart';
import 'package:flutter_crud/components/email_input.dart';
import 'package:flutter_crud/components/password_input.dart';
import 'package:flutter_crud/modules/home/home_store.dart';

import 'name_input.dart';

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
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NameInput(
              nameController: _nameController,
            ),
            EmailInput(
              maxLength: 20,
              emailController: _emailController,
            ),
            PasswordInput(
              maxLength: 10,
              passwordController: _passwordController,
            ),
            CpfInput(cpfController: _cpfController),
            const SizedBox(
              height: 10,
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
                        if (homeController.unlogged != true) {
                          if (worked) {
                            BotToast.showText(
                                text: "Usuário cadastrado com sucesso!");
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/home", (route) => false);
                          } else {
                            BotToast.showText(
                                text: "E-mail ou Cpf já existem!");
                          }
                        } else {
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/login", (route) => false);
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
