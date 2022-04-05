import 'package:guven_future/Pages/HomePage.dart';
import 'package:guven_future/Pages/SplashScreen.dart';
import 'package:guven_future/Services/RouterService.dart';
import 'package:guven_future/Utilities/Routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Güven Future Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouterService.generateRoute,
      initialRoute: SPLASH_SCREEN,
      home: const SplashScreen(),
    );
  }
}
