import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/main.dart';
import 'package:patrol/patrol.dart';

extension TestExtension on PatrolIntegrationTester {
  Future<void> openApp({int? loadDelay}) async {
    await pumpWidget(App(), const Duration(seconds: 5));
  }

  Future<void> tapByKey(Key key, {int pumpFrames = 1}) async {
    await tap(find.byKey(key));
    for (var i = 0; i < pumpFrames; i++) {
      await pump(const Duration(seconds: 1));
    }
  }

  Future<void> wait({int? pumpDelay, int? seconds}) async {
    for (var i = 0; i < (seconds ?? 60); i++) {
      await pump(const Duration(seconds: 1));
    }
    await pump(Duration(seconds: pumpDelay ?? 3));
  }
}
