import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_frontend/main.dart';

void main() {
  testWidgets('App loads with title and board present', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    // App bar title should be visible
    expect(find.text('Tic Tac Toe'), findsOneWidget);

    // There should be 9 tappable cells (InkWell)
    expect(find.byType(InkWell), findsNWidgets(9));

    // Status text should mention Player turn
    expect(find.textContaining('Player'), findsOneWidget);

    // New Game button exists
    expect(find.widgetWithText(ElevatedButton, 'New Game'), findsOneWidget);
  });

  testWidgets('Tapping a cell marks it', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());

    final firstCell = find.byType(InkWell).first;
    await tester.tap(firstCell);
    await tester.pumpAndSettle();

    // After first tap, an X should appear
    expect(find.text('X'), findsWidgets);
  });
}
