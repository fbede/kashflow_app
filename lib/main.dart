import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'src/app/app.dart';
import 'src/core/core.dart';
import 'src/shared/shared.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LocaleSettings.useDeviceLocale();

  await Future.wait([setWindowSettings(), registerSingletons()]);

  registerFontLicenses();

  final appName = (await PackageInfo.fromPlatform()).appName;

  runApp(
    ProviderScope(
      observers: [AppProviderObserver()],
      child: TranslationProvider(
        child: MyApp(appName),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp(this.appName, {super.key});

  final String appName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return TooltipVisibility(
      visible: false,
      child: MaterialApp.router(
        title: appName,
        theme: AppTheme(MaterialTheme.lightScheme()).themeData,
        darkTheme: AppTheme(MaterialTheme.darkScheme()).themeData,
        themeMode: themeMode,
        routerConfig: router,
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
      ),
    );
  }
}
