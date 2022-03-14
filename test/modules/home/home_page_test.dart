import 'package:flutter/material.dart';
import 'package:flutter_crud/modules/home/home_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should find all elements related to HomePage',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(Observer), findsOneWidget);
    expect(find.byType(Padding), findsNWidgets(4));
    expect(find.byType(Center), findsNWidgets(3));
    expect(find.byType(Row), findsNWidgets(2));
    expect(find.byType(IconButton), findsNWidgets(2));
  });
  testWidgets('Should navigate to New User Dialog',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    final Finder button = find.byIcon(Icons.add);
    await tester.tap(button);
    await tester.pumpAndSettle();
  });
}
