import 'package:flutter/material.dart';
import 'package:flutter_crud/components/cpf_input.dart';
import 'package:flutter_crud/components/email_input.dart';
import 'package:flutter_crud/components/name_input.dart';
import 'package:flutter_crud/components/password_input.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      "Testing if new user dialog component is loading all widgets correctly",
      (tester) async {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _cpfController = TextEditingController();
    final _nameController = TextEditingController();
    await tester.pumpWidget(MaterialApp(
      home: AlertDialog(
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
                        print("Cancelar Button Worked");
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
                        print("Enviar Button Worked");
                      },
                      child: const Text("Enviar"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
    expect(find.byType(Text), findsNWidgets(9));
    expect(find.byType(NameInput), findsWidgets);
    expect(find.byType(EmailInput), findsWidgets);
    expect(find.byType(CpfInput), findsWidgets);
    expect(find.byType(PasswordInput), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Form), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(ElevatedButton), findsNWidgets(2));
    expect(find.byType(SizedBox), findsNWidgets(8));

    var buttonCancelar = find.text("Cancelar");
    expect(buttonCancelar, findsOneWidget);
    await tester.tap(buttonCancelar);
    await tester.pump();

    var buttonEnviar = find.text("Enviar");
    expect(buttonEnviar, findsOneWidget);
    await tester.tap(buttonEnviar);
    await tester.pump();
  });
}
