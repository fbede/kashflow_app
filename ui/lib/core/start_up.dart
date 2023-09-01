import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kashflow_core/kashflow_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

bool resetDB = false;

Future<String> getReleaseInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();
  final appName = packageInfo.appName;
  final version = packageInfo.version;
  final String buildNumber = packageInfo.buildNumber;
  return '$appName $version+$buildNumber';
}

Future<void> setWindowSettings() async {
  if (kIsWeb) return;
  if (Platform.isAndroid || Platform.isIOS) return;
  await windowManager.ensureInitialized();

  const windowOptions = WindowOptions(
    size: Size(360, 640),
    minimumSize: Size(360, 640),
    alwaysOnTop: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
  );

  await windowManager.waitUntilReadyToShow(
    windowOptions,
    () async {
      await windowManager.show();
      await windowManager.focus();
    },
  );
}

Future<void> registerSingletons() async {
  final prefs = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferences>(prefs);
}
