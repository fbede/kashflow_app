import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/core/core.dart';
import 'src/shared/shared.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LocaleSettings.useDeviceLocale();

  await Future.wait([setWindowSettings(), registerSingletons()]);

  registerFontLicenses();

  runApp(
    ProviderScope(
      observers: [AppProviderObserver()],
      child: TranslationProvider(
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => TooltipVisibility(
        visible: false,
        child: MaterialApp.router(
          //TODO: Add AppName
          // title: UserText.appName,
          theme: AppTheme(MaterialTheme.lightScheme()).themeData,
          darkTheme: AppTheme(MaterialTheme.darkScheme()).themeData,
          //themeMode: ThemeMode.light, // themeMode,
          routerConfig: router,
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
        ),
      );
}
