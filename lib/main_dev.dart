import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/util/startup_functions.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';

//TODO: Remove TitleBar on Windows
//TODO: Update main.dart

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Handles window settings
  await setWindowSettings();

  //Handles intial splashscreen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Registers models e.g Shared Preferences on get_it
  await registerModelsOnGetIt();

  runApp(ProviderScope(child: const MyApp()));
}

Future<void> setWindowSettings() async {
  if (kIsWeb) return;
  if (Platform.isAndroid || Platform.isIOS) return;
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(360, 640),
    minimumSize: Size(360, 640),
    //maximumSize: Size(400, 600),
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
