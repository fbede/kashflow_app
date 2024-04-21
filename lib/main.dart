import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shared/provider_observer.dart';
import 'shared/router.dart';
import 'shared/start_up.dart';
import 'ui_elements/app_theme.dart';
import 'ui_elements/color_schemes.dart';
import 'ui_elements/user_text.dart';
import 'user_preferences_module/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([setWindowSettings(), registerSingletons()]);

  registerFontLicenses();

  runApp(
    ProviderScope(observers: [AppProviderObserver()], child: const MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider).themeMode;

    return TooltipVisibility(
      visible: false,
      child: MaterialApp.router(
        title: UserText.appName,
        theme: AppTheme(lightColorScheme).themeData,
        darkTheme: AppTheme(darkColorScheme).themeData,
        themeMode: themeMode,
        routerConfig: router,
      ),
    );
  }
}
