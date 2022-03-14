import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should find all elements related to User Tile',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: MediaQueryData(),
        child: Material(
            child: UserTile(
          email: "test@test.com",
          title: "test",
          id: "test",
        )),
      ),
    ));

    expect(find.byType(ListTile), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(2));
  });
}
