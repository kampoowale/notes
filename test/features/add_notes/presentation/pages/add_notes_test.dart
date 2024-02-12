import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notes/features/add_notes/presentation/pages/add_notes.dart';

main() {
  testWidgets(
      'Given I am on add notes screen '
      'when I press add button '
      'then it shows a dialog to add notes', (WidgetTester tester) async {
    await tester.pumpWidget(loadWidget(const AddNotes()));
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.text('Add notes'), findsOneWidget);
  });
}

Widget loadWidget(Widget child) {
  return MaterialApp(
    home: child,
  );
}
