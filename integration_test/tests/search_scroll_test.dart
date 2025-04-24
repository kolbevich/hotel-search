import 'package:patrol/patrol.dart';

import '../screens/base_screen.dart';
import '../utils/test_extension.dart';

void main() {
  patrolTest("I open Hotels tab, enter text in the search bar and see search results", ($) async {
    await $.openApp();
    final tabs = TabBar($);

    await $.wait(seconds: 5);

    final hotelsScreen = await tabs.openHotelsScreen();
    await hotelsScreen.searchBarEnter(text: "London");

    await hotelsScreen.scrollToHotelCardAt(index: 30);
  });
}
