// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myfirstapp/main.dart';

void main() {
  testWidgets("스타트 화면 표시", (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyFirstApp());

    final titleFinder = find.text("슬라이드퍼즐");
  });

  testWidgets('스타트 화면 위젯 생성', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyFirstApp());

    expect(find.text("슬라이드퍼즐"), findsOneWidget);
    expect(find.text("스타트"), findsOneWidget);
    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
