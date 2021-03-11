import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_template/services/navigation/NavigationService.dart';
import 'package:mvvm_template/services/service_locator.dart';
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
          // case 'quran_challenge_congratulation_screen':
          //   QuranChallengeCongratulationScreen args = routeSettings.arguments;
          //   return MaterialPageRoute(builder: (context) => QuranChallengeCongratulationScreen(
          //     challengeId: args.challengeId,
          //     challengeStar: args.challengeStar,
          //     challenge: args.challenge,
          //     quranTextOriginalList: args.quranTextOriginalList,
          //   ));
          case 'test_screen':
            return MaterialPageRoute(builder: (context) => TestScreen());
          default:
            return MaterialPageRoute(builder: (context) => TestScreen());
        }
      },
      home: TestScreen(),
    );
  }
}
