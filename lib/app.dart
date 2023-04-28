import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/router/app_router.dart';
import 'package:kashflow/ui/elements/themes.dart';
import 'package:kashflow/util/visible_strings.dart';

//TODO: FIX ME
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Removes initial splashscreen
    FlutterNativeSplash.remove();

    //  final themeMode =
    //   ref.watch(settingsProvider.select((settings) => settings.themeMode));

    return TooltipVisibility(
      visible: false,
      child: MaterialApp.router(
        title: APPNAME,
        //TODO: Fix after Settings is solved
        themeMode: ThemeMode.light,
        theme: lightFlexTheme,
        darkTheme: darkFlexTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
