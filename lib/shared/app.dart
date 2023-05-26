import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../user preferences module/theme_provider.dart';
import 'router.dart';
import 'themes.dart';
import 'user_text.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => TooltipVisibility(
        visible: false,
        child: MaterialApp.router(
          title: UserText.appName,
          theme:
              getLightTheme(isWhite: ref.watch(themesProvider).isBlackAndWhite),
          darkTheme:
              getDarkTheme(isBlack: ref.watch(themesProvider).isBlackAndWhite),
          themeMode: ref.watch(themesProvider).themeMode,
          routerConfig: router,
        ),
      );
}
