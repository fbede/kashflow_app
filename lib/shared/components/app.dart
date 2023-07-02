import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/shared/core/router.dart';
import 'package:kashflow/shared/themes.dart';
import 'package:kashflow/shared/user_text.dart';
import 'package:kashflow/user%20preferences%20module/theme_provider.dart';

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
