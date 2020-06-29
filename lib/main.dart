import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_by_google/pages/AdPage.dart';
import 'package:flutter_by_google/pages/HomePage.dart';
import 'package:flutter_by_google/pages/IntroductionPage.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return PageTransition(
                child: IntroductionPage(), type: PageTransitionType.fade);
            break;
          case "/home":
            return PageTransition(
                child: HomePage(), type: PageTransitionType.fade);
            break;
          case "/adPage":
            return PageTransition(
                child: AddPage(), type: PageTransitionType.downToUp);
            break;
          default:
            return null;
        }
      },
    );
  }
}
