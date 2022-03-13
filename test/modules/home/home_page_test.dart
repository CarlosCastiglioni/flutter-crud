import 'package:flutter/material.dart';
import 'package:flutter_crud/modules/home/home_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Testando se a homepage carrega todos os widgets necessários',
      (tester) async {
    final controller = HomeStore();

    await tester.pumpWidget(MediaQuery(
      data: const MediaQueryData(),
      child: Builder(builder: (context) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: TextButton(
                        onPressed: () {
                          print("Botão Sair Funcionou");
                          controller.logout();
                        },
                        child: const Text(
                          "Sair",
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        )),
                  ),
                  const Text(
                    "Lista de usuários",
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    print("Botão Dialog Funcionou");
                  },
                  child: const Text(
                    "+ Novo Usuário",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    ));
    expect(find.byType(TextButton), findsNWidgets(2));
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(Row), findsNWidgets(2));
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Text), findsNWidgets(3));
    expect(find.text('+ Novo Usuário'), findsOneWidget);
    expect(find.text('Lista de usuários'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);

    var buttonDialog = find.text("+ Novo Usuário");
    expect(buttonDialog, findsOneWidget);
    await tester.tap(buttonDialog);
    await tester.pump();

    var buttonSair = find.text("Sair");
    expect(buttonSair, findsOneWidget);
    await tester.tap(buttonSair);
    await tester.pump();
  });
}
