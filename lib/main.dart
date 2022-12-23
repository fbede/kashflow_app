import 'package:flutter/material.dart';
import 'package:kashflow/router/app_router.dart';
import 'package:kashflow/util/strings.dart';

import 'theme/color_scheme.dart';

//TODO: App Icon Attribution
//TODO: Modify App Icon

/**
 * Put text below on AppStore description
 * AppIcon created by Freepik - Flaticon
 * Link - https://www.flaticon.com/free-icons/cash-flow
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appName,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      routerConfig: appRouter,
    );
  }
}
