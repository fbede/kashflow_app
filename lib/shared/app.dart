import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          theme: getLightTheme(),
          darkTheme: getDarkTheme(),
          routerConfig: router,
        ),
      );
}
