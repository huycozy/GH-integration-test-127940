import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpUntilFound on WidgetTester {
  Future<void> pumpUntilFound(
    WidgetTester tester,
    Finder finder, {
    Duration timeout = const Duration(seconds: 20),
  }) async {
    final end = DateTime.now().add(timeout);

    do {
      if (DateTime.now().isAfter(end)) {
        throw Exception('Timed out waiting for $finder');
      }

      await tester.pumpAndSettle();
      await Future.delayed(const Duration(milliseconds: 100));
    } while (finder.evaluate().isEmpty);
  }

  Future<void> restoreFlutterError(Future<void> Function() call) async {
    final originalOnError = FlutterError.onError!;
    await call();
    final overriddenOnError = FlutterError.onError!;

    // restore FlutterError.onError
    FlutterError.onError = (FlutterErrorDetails details) {
      if (overriddenOnError != originalOnError) overriddenOnError(details);
      originalOnError(details);
    };
  }
}
