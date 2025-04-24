import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../screens/base_screen.dart';
import '../utils/test_extension.dart';

void main() {
  patrolTest(
      "I add a hotel to favorites from the search results list and see it appear on the favorites screens",
      ($) async {
    await $.openApp();
    final tabs = TabBar($);

    await $.wait(seconds: 5);

    final hotelsScreen = await tabs.openHotelsScreen();
    await hotelsScreen.searchBarEnter(text: "New York");

    final firstHotelTitle = await hotelsScreen.getTitleAt(index: 0);
    await hotelsScreen.addToFavoritesAt(index: 0);

    final favoritesScreen = await tabs.openFavoritesScreen();

    expect(favoritesScreen.hasHotelWith(title: firstHotelTitle), true,
        reason: "Expected to see favorited hotel with title $firstHotelTitle on favorites screen");

    await tabs.openHotelsScreen();

    // unfavorite the same hotel
    await hotelsScreen.addToFavoritesAt(index: 0);

    await tabs.openFavoritesScreen();
    expect(favoritesScreen.hasHotelWith(title: firstHotelTitle), false,
        reason: "Expected not to see unfavorited hotel on favorites screen");
  });
}
