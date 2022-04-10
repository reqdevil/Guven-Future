import 'package:guven_future/Models/News.dart';
import 'package:guven_future/Models/Source.dart';
import 'package:guven_future/Pages/SplashScreen.dart';
import 'package:guven_future/Services/RouterService.dart';
import 'package:guven_future/Utilities/Helpers.dart';
import 'package:guven_future/Utilities/Routes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  
  Hive.registerAdapter(NewsAdapter());
  Hive.registerAdapter(SourceAdapter());

  setupGetIt();

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
