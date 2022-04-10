// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:guven_future/Services/HiveService.dart';
import 'package:guven_future/Services/Manager/ServerManager.dart';
import 'package:guven_future/Utilities/AppColors.dart';

final getIt = GetIt.instance;

void dissmissKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

showStatusBar() {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
}

hideStatusBar() {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [],
  );
}

setStatusBarIconColorToLight() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ),
  );
}

setStatusBarIconColorToDark() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.black,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ),
  );
}

void setupGetIt() {
  getIt.registerLazySingleton(() => ServerManager());
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => HiveService());
}