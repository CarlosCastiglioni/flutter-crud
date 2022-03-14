import 'package:flutter/material.dart';
import 'package:flutter_crud/components/cpf_input.dart';
import 'package:flutter_crud/components/email_input.dart';
import 'package:flutter_crud/components/name_input.dart';
import 'package:flutter_crud/components/new_user_dialog.dart';
import 'package:flutter_crud/components/password_input.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should find all elements related to New User Dialog',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(home: NewUserDialog()),
      ),
    ));

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(EmailInput), findsOneWidget);
    expect(find.byType(NameInput), findsOneWidget);
    expect(find.byType(CpfInput), findsOneWidget);
    expect(find.byType(PasswordInput), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(9));
    expect(find.byType(Column), findsNWidgets(2));
    expect(find.byType(SizedBox), findsNWidgets(8));
  });
}
