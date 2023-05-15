import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/router/app_router.dart';
import 'package:kashflow/ui/elements/themes.dart';
import 'package:kashflow/util/visible_strings.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => TooltipVisibility(
        visible: false,
        child: MaterialApp.router(
          title: APPNAME,
          theme: lightFlexTheme,
          darkTheme: darkFlexTheme,
          routerConfig: appRouter,
        ),
      );
}
