import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../screens/base_screen.dart';
import '../utils/test_extension.dart';

void main() {
  patrolTest("I open Hotels tab, enter text in the search bar and see search results", ($) async {
    await $.openApp();
    final tabs = TabBar($);

    final hotelsScreen = await tabs.openHotelsScreen();
    await hotelsScreen.searchBarEnter(text: "London");

    final isResultEmpty = await hotelsScreen.isSearchResultEmpty();

    expect(isResultEmpty, false, reason: "Expected search result with hotels");
  });
}
