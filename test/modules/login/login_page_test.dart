import 'package:flutter/material.dart';
import 'package:flutter_crud/components/email_input.dart';
import 'package:flutter_crud/components/password_input.dart';
import 'package:flutter_crud/modules/login/login_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      "Testing if login page component is loading all widgets correctly",
      (tester) async {
    final controller = LoginStore();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    await tester.pumpWidget(MediaQuery(
      data: const MediaQueryData(),
      child: Builder(builder: (context) {
        return MaterialApp(
          home: Scaffold(
            body: Form(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(50.0),
                        child: Center(
                            child: Text(
                          "Login",
                          style: TextStyle(color: Colors.green, fontSize: 30),
                        )),
                      ),
                      EmailInput(
                        emailController: _emailController,
                      ),
                      PasswordInput(passwordController: _passwordController),
                      ElevatedButton(
                          onPressed: () async {
                            print("Button Login Worked");
                            await controller.login();
                          },
                          child: const Text("Entrar"))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    ));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(Center), findsNWidgets(2));
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(ElevatedButton), findsWidgets);
    expect(find.byType(Text), findsNWidgets(4));
    expect(find.text('Login'), findsOneWidget);

    var button = find.text("Entrar");
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pump();
  });
}
