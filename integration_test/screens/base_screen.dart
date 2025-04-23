import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking/constants/lib/key_constants.dart';
import 'package:patrol/patrol.dart';

import '../utils/test_extension.dart';
import 'favorites_screen.dart';
import 'hotels_screen.dart';
import 'overview_screen.dart';

abstract class BaseScreen {
  final PatrolIntegrationTester tester;
  final List<Key> screenElements;
  final Map<Key, Finder> finderElements;

  BaseScreen({
    required this.tester,
    required this.screenElements,
  }) : finderElements = initElements(screenElements);

  // this will allow to check all necessary elemnents on the screen on screen initialization
  static Map<Key, Finder> initElements(List<Key> initKeys) {
    Map<Key, Finder> elements = {};
    for (final Key key in initKeys) {
      final element = find.byKey(key);
      expect(element, findsOneWidget,
          reason: "Expected to find element with key $key on the current screen");
      elements.addAll({
        key: element,
      });
    }

    return elements;
  }
}

class TabBar {
  final PatrolIntegrationTester tester;

  TabBar(this.tester);

  Future<FavoritesScreen> openFavoritesScreen() async {
    await tester.tapByKey(K.favoritesTabKey);

    return FavoritesScreen(tester);
  }

  Future<HotelsScreen> openHotelsScreen() async {
    await tester.tapByKey(K.hotelsTabKey);

    return HotelsScreen(tester);
  }

  Future<OverviewScreen> openOverviewScreen() async {
    await tester.tapByKey(K.overviewTabKey);

    return OverviewScreen(tester);
  }

  // TODO: make this method return screen object
  Future<void> openAccountScreen() async {
    await tester.tapByKey(K.accountTabKey);
  }
}
