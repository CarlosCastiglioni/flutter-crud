import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/components/email_input.dart';
import 'package:flutter_crud/components/password_input.dart';
import 'package:flutter_crud/modules/login/login_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginStore();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Observer(
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    EmailInput(
                      emailController: _emailController,
                    ),
                    PasswordInput(passwordController: _passwordController),
                    ElevatedButton(
                        onPressed: () async {
                          username = _emailController.text;
                          password = _passwordController.text;
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (_formKey.currentState!.validate()) {
                            bool worked = await controller.login();
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            if (worked) {
                              Navigator.pushReplacementNamed(context, "/home");
                            } else {
                              _passwordController.clear();
                              BotToast.showText(
                                  text: "E-mail ou senha inválidos");
                            }
                          }
                        },
                        child: const Text("Entrar"))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
