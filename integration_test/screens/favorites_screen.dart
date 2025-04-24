import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/constants/lib/key_constants.dart';
import 'package:patrol/patrol.dart';

import 'base_screen.dart';

class FavoritesScreen extends BaseScreen {
  FavoritesScreen(PatrolIntegrationTester tester)
      : super(
          tester: tester,
          screenElements: [
            K.favoriteScreenTitleKey,
          ],
        );

  bool hasHotelWith({required String title}) {
    final hotelTitleFinders = tester(K.hotelCardTitleKey).evaluate();

    return hotelTitleFinders.any((element) {
      final text = (element.widget as Text).data;
      return text == title;
    });
  }

  Future<String> getTitleAt({required int index}) async {
    final titleFinders = tester(K.hotelCardTitleKey);

    // Ensure the index is within bounds
    expect(titleFinders.evaluate().length > index, true,
        reason: 'Not enough titles found for index $index');

    // Get and return the text from the Text widget
    final textWidget = titleFinders.at(index).evaluate().first.widget as Text;
    return textWidget.data ?? textWidget.textSpan?.toPlainText() ?? '';
  }

  Future<void> unfavoriteAt({required int index}) async {
    final favoriteButtonFinders = tester(K.hotelCardFavoriteIconButtonKey);

    // Check index is within bounds
    expect(favoriteButtonFinders.evaluate().length > index, true,
        reason: 'No favorite icon button at index $index');

    // Tap the favorite icon at the specified index
    await favoriteButtonFinders.at(index).tap();
  }

  Future<void> unfavoriteBy({required String title}) async {
    final titleFinders = tester(K.hotelCardTitleKey).evaluate();

    // Loop through and find the index of the title that matches
    int? matchIndex;
    for (int i = 0; i < titleFinders.length; i++) {
      final widget = titleFinders.elementAt(i).widget as Text;
      if (widget.data == title) {
        matchIndex = i;
        break;
      }
    }

    // If not found, throw an error
    if (matchIndex == null) {
      throw Exception('No hotel card found with title "$title"');
    }

    // Tap the favorite icon at the same index
    await tester(K.hotelCardFavoriteIconButtonKey).at(matchIndex).tap();
  }

  Future<bool> isEmpty() async {
    final emptyIconFinder = tester(K.favoritesEmptyIconKey);

    // Check if it's visible in the UI
    return emptyIconFinder.evaluate().isNotEmpty && emptyIconFinder.visible;
  }

  // TODO: remove all
  // TODO: scroll to
}
