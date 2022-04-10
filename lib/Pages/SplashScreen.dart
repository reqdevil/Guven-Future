// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:guven_future/Utilities/AppColors.dart';
import 'package:guven_future/Utilities/Constants.dart';
import 'package:guven_future/Utilities/Helpers.dart';
import 'package:guven_future/Utilities/Routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    hideStatusBar();

    Future.delayed(const Duration(seconds: 2), () async {
      setState(() {
        _visible = true;
      });
    });

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      Future.delayed(const Duration(seconds: 3), () async {
        showStatusBar();
        Navigator.pushNamed(context, HOME_PAGE);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This is for iPhoneX and advanced versions.
    statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.mainColor,
              AppColors.mainColor,
              AppColors.mainColor,
              AppColors.mainColor,
            ],
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                curve: Curves.easeInOut,
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(seconds: 2),
                child: const SizedBox(
                  height: 150,
                  child: Image(
                      image: ExactAssetImage('assets/GuvenFutureLogo.png')),
                ),
              ),
              const Text(
                'Hoşgeldiniz',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
