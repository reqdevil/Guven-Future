// ignore_for_file: file_names
import 'package:guven_future/Pages/HomePage.dart';
import 'package:guven_future/Pages/SplashScreen.dart';
import 'package:guven_future/Utilities/Routes.dart';
import 'package:flutter/material.dart';

class RouterService {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case HOME_PAGE:
        return MaterialPageRoute(
          builder: (_) => const HomePage(title: "Home Page"),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text("Something went wrong."),
            ),
          ),
        );
    }
  }
}
