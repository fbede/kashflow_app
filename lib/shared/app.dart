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
    final themeMode = ref.watch(themesProvider).asData?.value.themeMode;
    final isBlackAndWhiteBackground =
        ref.watch(themesProvider).asData?.value.isBlackAndWhite;

    return TooltipVisibility(
      visible: false,
      child: MaterialApp.router(
        title: UserText.appName,
        theme: getLightTheme(isWhite: isBlackAndWhiteBackground ?? true),
        darkTheme: getDarkTheme(isBlack: isBlackAndWhiteBackground ?? true),
        themeMode: themeMode,
        routerConfig: router,
      ),
    );
  }
}
