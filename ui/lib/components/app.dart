import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../user_preferences_module/theme_provider.dart';
import '../core/router.dart';
import '../ui_elements/themes.dart';
import '../ui_elements/user_text.dart';

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
        theme: lightTheme,
        darkTheme: flexDarkTheme,
        themeMode: themeMode,
        routerConfig: router,
      ),
    );
  }
}
