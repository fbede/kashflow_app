import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kashflow/router/app_router.dart';
import 'package:kashflow/util/strings.dart';

import 'startup.dart';
import 'theme/color_scheme.dart';

//TODO: App Icon Attribution
//TODO: Modify App Icon

/**
 * Put text below on AppStore description
 * AppIcon created by Freepik - Flaticon
 * Link - https://www.flaticon.com/free-icons/cash-flow
 */

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Handles intial splashscreen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Handles Window Setting on desktop
  await setWindowSettings();

  //Registers models e.g Shared Preferences on get_it
  await registerModelsOnGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Removes initial splashscreen
    FlutterNativeSplash.remove();

    return MaterialApp.router(
      title: APPNAME,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      routerConfig: appRouter,
    );
  }
}
