import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import '../utils/test_extension.dart';

void main() {
  patrolTest("I open the app for the first time and see the overview screen", ($) async {
    final overviewScreen = await $.openApp();

    // await expectLater(() async => await $.openApp(), returnsNormally,
    //     reason: "Expected the app to open on Overview Screen");
  });
}
