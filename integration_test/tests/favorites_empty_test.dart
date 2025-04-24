import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../screens/base_screen.dart';
import '../utils/test_extension.dart';

void main() {
  patrolTest("I open the app and go to the Favorites screen", ($) async {
    await $.openApp();
    final tabs = TabBar($);

    final favoritesScreen = await tabs.openFavoritesScreen();

    final isEmpty = await favoritesScreen.isEmpty();

    expect(isEmpty, true, reason: "Expected to have empty state icon on favorites screen");
  });
}
