import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../screens/base_screen.dart';
import '../utils/test_extension.dart';

void main() {
  patrolTest("I open the app and go to the Hotels screen", ($) async {
    await $.openApp();
    final tabs = TabBar($);

    await $.wait(seconds: 5);

    final hotelsScreen = await tabs.openHotelsScreen();

    final isResultEmpty = await hotelsScreen.isSearchResultEmpty();

    expect(isResultEmpty, true, reason: "Expected to have empty state icon on hotels screen");
  });
}
