import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router.dart';
import 'core/start_up.dart';
import 'ui_elements/themes.dart';
import 'ui_elements/user_text.dart';
import 'user_preferences_module/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([setWindowSettings(), registerSingletons()]);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themesProvider).themeMode;
    final useDeepBlacks = ref.watch(themesProvider).useDeepBlacks;

    return TooltipVisibility(
      visible: false,
      child: MaterialApp.router(
        title: UserText.appName,
        theme: lightTheme(useDeepBlacks: useDeepBlacks),
        darkTheme: darkTheme(useDeepBlacks: useDeepBlacks),
        themeMode: themeMode,
        routerConfig: router,
      ),
    );
  }
}
