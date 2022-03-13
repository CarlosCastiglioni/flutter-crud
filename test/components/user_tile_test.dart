import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Testing if user tile component is loading all widgets correctly",
      (tester) async {
    await tester.pumpWidget(MediaQuery(
      data: const MediaQueryData(),
      child: Builder(builder: (context) {
        return Material(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(""),
              subtitle: Text(""),
              trailing: IconButton(
                  onPressed: () async {
                    print("Button Delete Worked");
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ),
          ),
        );
      }),
    ));
    expect(find.byType(Text), findsNWidgets(2));
    expect(find.byType(IconButton), findsWidgets);
    expect(find.byIcon(Icons.delete), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);

    var button = find.byIcon(Icons.delete);
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pump();
  });
}
