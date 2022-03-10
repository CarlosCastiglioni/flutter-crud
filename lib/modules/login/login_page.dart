import 'package:flutter/material.dart';
import 'package:flutter_crud/modules/home/home_page.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Observer(
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: "E-mail"),
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
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return "Por favor, digite sua senha";
                        } else if (password.length < 6) {
                          return "Por favor, digite uma senha maior que 6 caracteres";
                        }
                        return null;
                      },
                    ),
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            } else {
                              _passwordController.clear();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
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

  final snackBar = SnackBar(
    content: Text(
      "E-mail ou senha inválidos",
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
  );
}
