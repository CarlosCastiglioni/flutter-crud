import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      "Testing if delete confirmation component is loading all widgets correctly",
      (tester) async {
    await tester.pumpWidget(Builder(builder: (context) {
      return MaterialApp(
        home: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Deseja confirmar a exclusão deste usuário?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AlertDialog(
                  title: const Text("Confirmar exclusão."),
                  content: ElevatedButton(
                      onPressed: () {
                        print("Close Delete Button Worked");
                      },
                      child: const Text("Não"),
                      style: ElevatedButton.styleFrom(primary: Colors.red)),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      print("Delete Confirmation Button Worked");
                    },
                    child: const Text("Sim"),
                    style: ElevatedButton.styleFrom(primary: Colors.green)),
              ],
            ),
          ],
        ),
      );
    }));
    expect(find.byType(Text), findsNWidgets(4));
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(ElevatedButton), findsNWidgets(2));

    var buttonSim = find.text("Sim");
    expect(buttonSim, findsOneWidget);
    await tester.tap(buttonSim);
    await tester.pump();

    var buttonNao = find.text("Não");
    expect(buttonNao, findsOneWidget);
    await tester.tap(buttonNao);
    await tester.pump();
  });
}
