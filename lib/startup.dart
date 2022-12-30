import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

Future<void> setWindowSettings() async {
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    minimumSize: Size(400, 600),
    alwaysOnTop: true,
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(
    windowOptions,
    () async {
      await windowManager.show();
      await windowManager.focus();
    },
  );
}

Future<void> registerModelsOnGetIt() async {
  //Register SharedPreferences
  GetIt.I.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
}
