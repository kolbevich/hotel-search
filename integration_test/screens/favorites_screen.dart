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

  // TODO: remove from favorites at
  // TODO: remove all
  // TODO: is empty
}
