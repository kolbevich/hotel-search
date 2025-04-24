import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hotel_booking/core/di/injectable.dart';
import 'package:hotel_booking/i18n/strings.g.dart';
import 'package:hotel_booking/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:patrol/patrol.dart';

import '../screens/overview_screen.dart';

extension TestExtension on PatrolIntegrationTester {
  Future<OverviewScreen> openApp() async {
    Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
    configureDependencies();
    await pumpWidget(App(), const Duration(seconds: 5));

    await pump(const Duration(seconds: 2));

    return OverviewScreen(this);
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
