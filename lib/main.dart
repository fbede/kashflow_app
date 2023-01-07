import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/providers/providers.dart';
import 'package:kashflow/router/app_router.dart';
import 'package:kashflow/theme/themes.dart';
import 'package:kashflow/util/strings.dart';

import 'util/startup_functions.dart';

//TODO: Remove TitleBar on Windows
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

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Removes initial splashscreen
    FlutterNativeSplash.remove();

    final themeMode =
        ref.watch(settingsProvider.select((settings) => settings.themeMode));

    return TooltipVisibility(
      visible: false,
      child: MaterialApp.router(
        title: APPNAME,
        themeMode: themeMode,
        theme: lightThemeData,
        darkTheme: darkThemeData,
        routerConfig: appRouter,
      ),
    );
  }
}
