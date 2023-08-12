import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kashflow_ui/main.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setWindowSettings();
  runApp(const MainApp());
}

Future<void> _setWindowSettings() async {
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
