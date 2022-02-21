
import 'package:flutter/material.dart';
import 'package:greentickpracticaldemo/ui/screen/home_page.dart';
import 'package:greentickpracticaldemo/ui/screen/splash/splash_screen.dart';

//created on 25/09/2021
//purpose : common app route class to maintain transition from diffrent screens
class AppRouterPath {
  static const loginScreen = '/login';
  static const home = '/home';
}

class AppRouter {
  MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterPath.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
    }
  }
}
