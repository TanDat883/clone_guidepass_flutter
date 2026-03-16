import 'package:flutter/material.dart';
import 'package:clone_guidepass/screens/welcome/welcome_screen.dart';
import 'package:clone_guidepass/screens/home/home_screen.dart';
import 'package:clone_guidepass/screens/tour/tour_list_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String welcome = '/';
  static const String home = '/home';
  static const String tourList = '/tour-list';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case tourList:
        return MaterialPageRoute(builder: (_) => const TourListScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Route not found: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
