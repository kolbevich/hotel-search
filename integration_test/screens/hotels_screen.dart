import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/constants/lib/key_constants.dart';
import 'package:patrol/patrol.dart';

import '../utils/test_extension.dart';
import 'base_screen.dart';

class HotelsScreen extends BaseScreen {
  HotelsScreen(PatrolIntegrationTester tester)
      : super(
          tester: tester,
          screenElements: [
            K.searchBarKey,
          ],
        );

  Future<void> searchBarEnter({required String text}) async {
    await tester(K.searchBarKey).enterText(text);

    await tester.wait(seconds: 5);

    expect(tester(K.hotelCardTitleKey).evaluate().isNotEmpty, true,
        reason: 'Expected at least one hotel result to appear');
  }

  Future<String> getTitleAt({required int index}) async {
    final titles = tester(K.hotelCardTitleKey);

    // Ensure the index is within bounds
    expect(titles.evaluate().length > index, true,
        reason: 'Not enough titles found for index $index');

    // Get and return the text from the Text widget
    final textWidget = titles.at(index).evaluate().first.widget as Text;
    return textWidget.data ?? textWidget.textSpan?.toPlainText() ?? '';
  }

  Future<void> addToFavoritesAt({required int index}) async {
    final favoriteButtonFinders = tester(K.hotelCardFavoriteIconButtonKey);

    // Ensure there are enough hotels visible in the search result
    expect(favoriteButtonFinders.evaluate().length > index, true,
        reason: 'Not enough favorite buttons in the list');

    // Tap the favorite button at the specified index
    await favoriteButtonFinders.at(index).tap();
  }

  Future<void> scrollToHotelCardAt({required int index}) async {
    final hotelTitle = tester(K.hotelCardTitleKey).at(index);
    await hotelTitle.scrollTo(settleBetweenScrollsTimeout: Duration(seconds: 3));
  }

  Future<void> clearSearchInput() async {
    await tester(K.clearSearchBarIconButtonKey).tap();
  }

  Future<bool> isSearchResultEmpty() async {
    final emptyIcon = tester(K.searchResultsEmptyIconKey);

    // Check if it's visible in the UI
    return emptyIcon.evaluate().isNotEmpty && emptyIcon.visible;
  }
}
