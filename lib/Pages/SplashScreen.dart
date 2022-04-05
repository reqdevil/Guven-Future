// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
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
              Padding(
                padding: const EdgeInsets.only(bottom: 25.33),
                child: AnimatedOpacity(
                  curve: Curves.easeInOut,
                  opacity: _visible ? 1.0 : 0.0,
                  duration: const Duration(seconds: 2),
                  child: Container(
                    height: 150,
                    color: AppColors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 43, right: 43),
                child: Text(
                  'Hoşgeldiniz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
