import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_github_actions/main.dart' as app;

import 'robots/home_robot.dart';

void main(List<String> args) {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  HomeRobot homeRobot;

  testWidgets(
    'should increment value by 1 when floating button clicked.',
    (tester) async {
      app.main();

      homeRobot = HomeRobot(tester);

      await homeRobot.waitForHomeScreen();
      await homeRobot.tapFabButton();
      await homeRobot.checkVisibleCount('1');
    },
  );
}
