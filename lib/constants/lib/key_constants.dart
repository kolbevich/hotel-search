library;

export 'key_constants.dart';

// TODO: Export any libraries intended for clients of this package.
import 'package:flutter/material.dart';

class K {
  // search screen
  static const clearSearchBarIconButtonKey = Key("clearSearchBarIconButton");
  static const searchBarKey = Key("searchBarKey");
  static const searchReloadLoaderKey = Key("searchReloadLoaderKey");
  static const searchLoadNextLoaderKey = Key("searchLoadNextLoaderKey");
  static const searchResultsEmptyIconKey = Key("searchResultsEmptyIconKey");

  // favorite screen
  static const favoritesEmptyIconKey = Key("favoritesEmptyIconKey");
  static const favoriteScreenTitleKey = Key("favoriteScreenTitleKey");

  //overview screen
  static const overviewScreenTitleKey = Key("overviewScreenTitleKey");
  static const overviewEmptyIconKey = Key("overviewEmptyIconKey");

  //account screen
  static const accountScreenTitleKey = Key("accountScreenTitleKey");
  static const accountEmptyIconKey = Key("accountEmptyIconKey");

  // tabs
  static const hotelsTabKey = Key("hotelsTabKey");
  static const favoritesTabKey = Key("favoritesTabKey");
  static const accountTabKey = Key("profileTabKey");
  static const overviewTabKey = Key("overviewTabKey");

  // common use ui elements
  static const hotelCardFavoriteIconButtonKey = Key("hotelCardFavoriteIconButtonKey");
  static const hotelCardTitleKey = Key("hotelCardTitleKey");
  static const holetCardDescriptionKey = Key("holetCardDescriptionKey");
}
