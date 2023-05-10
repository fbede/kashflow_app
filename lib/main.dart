import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/util/startup_functions.dart';

import 'app.dart';

//TODO: Update from main_dev

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //setupDB();

  //Handles intial splashscreen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Registers models e.g Shared Preferences on get_it
  await registerModelsOnGetIt();

  runApp(ProviderScope(child: const MyApp()));
}
/* 
Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://0e93df11c77444e6a5e1a3ab2d79299a@o4505158999408640.ingest.sentry.io/4505159001767936';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(MyApp()),
  );

  // or define SENTRY_DSN via Dart environment variable (--dart-define)
} */