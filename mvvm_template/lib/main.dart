import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_template/services/navigation/navigation_service.dart';
import 'package:mvvm_template/services/service_locator.dart';
import 'package:mvvm_template/ui/views/second_screen.dart';
import 'package:mvvm_template/ui/views/test_screen.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
    await setupServiceLocator();
    runApp(MyApp());
  } catch (error) {
    print("Locator setup has failed: $error");
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: serviceLocator<NavigationService>().navigatorKey,
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          // case 'challenge_congratulation_screen':
          //   ChallengeCongratulationScreen args = routeSettings.arguments;
          //   return MaterialPageRoute(builder: (context) => ChallengeCongratulationScreen(
          //     challengeId: args.challengeId,
          //   ));
          case 'test_screen':
            return MaterialPageRoute(builder: (context) => TestScreen());
          case 'second_screen':
            return MaterialPageRoute(builder: (context) => SecondScreen());
          default:
            return MaterialPageRoute(builder: (context) => TestScreen());
        }
      },
      home: TestScreen(),
    );
  }
}
