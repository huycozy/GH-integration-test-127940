import 'package:flutter/material.dart';
import 'package:flutter_github_actions/main.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/tester_extension.dart';

class HomeRobot {
  const HomeRobot(this.tester);

  final WidgetTester tester;

  Future<void> waitForHomeScreen() async {
    await tester.pumpUntilFound(tester, find.byType(MyHomePage));
  }

  Future<void> tapFabButton() async {
    await tester.tap(find.byKey(const ValueKey('increment-button')));
    await tester.pump();
  }

  Future<void> checkVisibleCount(String number) async {
    expect(
      find.text(number),
      findsOneWidget,
    );
  }
}
