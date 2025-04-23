import 'package:hotel_booking/constants/lib/key_constants.dart';
import 'package:patrol/patrol.dart';

import 'base_screen.dart';

class HotelsScreen extends BaseScreen {
  HotelsScreen(PatrolIntegrationTester tester)
      : super(
          tester: tester,
          screenElements: [
            K.searchBarKey,
          ],
        );

  // TODO: search smth
  // TODO: clear search
  // TODO: scroll to
  // TODO: is empty
}
