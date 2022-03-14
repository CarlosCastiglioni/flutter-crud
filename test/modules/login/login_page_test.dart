import 'package:flutter/material.dart';
import 'package:flutter_crud/components/email_input.dart';
import 'package:flutter_crud/components/password_input.dart';
import 'package:flutter_crud/modules/login/login_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should find all elements related to LoginPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(Center), findsNWidgets(2));
    expect(find.byType(Text), findsNWidgets(4));
    expect(find.byType(EmailInput), findsOneWidget);
    expect(find.byType(PasswordInput), findsOneWidget);
  });
}
