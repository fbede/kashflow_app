import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../user preferences module/theme_provider.dart';
import 'router.dart';
import 'themes.dart';
import 'user_text.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themesProvider).themeMode;
    final isBlackAndWhiteBackground = ref.watch(themesProvider).isBlackAndWhite;

    return TooltipVisibility(
      visible: false,
      child: MaterialApp.router(
        title: UserText.appName,
        theme: getLightTheme(isWhite: isBlackAndWhiteBackground),
        darkTheme: getDarkTheme(isBlack: isBlackAndWhiteBackground),
        themeMode: themeMode,
        routerConfig: router,
      ),
    );
  }
}
