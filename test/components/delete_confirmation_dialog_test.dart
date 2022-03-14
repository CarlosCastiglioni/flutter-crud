import 'package:flutter/material.dart';
import 'package:flutter_crud/components/delete_confirmation_dialog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should find all elements related to Delete Confirmation Dialog',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: DeleteConfirmationDialog(id: "test")));

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(4));
    expect(find.byType(ElevatedButton), findsNWidgets(2));
    expect(find.byType(Column), findsNWidgets(2));
  });
}
