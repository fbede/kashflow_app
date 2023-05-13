import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/config/env.dart';
import 'package:kashflow/shared/app.dart';
import 'package:kashflow/shared/startup_functions.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:window_manager/window_manager.dart';

//TODO: Replace Animated splash screen

const _environment = 'Development';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options
        ..dsn = Env.sentryDsn
        ..environment = _environment
        ..tracesSampleRate = 0;
    },
    appRunner: _appRunner,
  );
}

Future<void> _appRunner() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await _setWindowSettings();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await registerSingletonsOnGetIt();

  runApp(const ProviderScope(child: MyApp()));
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
