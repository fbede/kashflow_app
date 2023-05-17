import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../util/visible_strings.dart';
import 'router.dart';
import 'themes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => TooltipVisibility(
        visible: false,
        child: MaterialApp.router(
          title: APPNAME,
          theme: getLightTheme(),
          darkTheme: getDarkTheme(),
          routerConfig: getRouter(),
        ),
      );
}
