import 'package:hotel_booking/constants/lib/key_constants.dart';
import 'package:patrol/patrol.dart';

import 'base_screen.dart';

class OverviewScreen extends BaseScreen {
  OverviewScreen(PatrolIntegrationTester tester)
      : super(
          tester: tester,
          screenElements: [K.overviewScreenTitleKey, K.overviewEmptyIconKey],
        );
}
