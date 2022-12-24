import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/screens/mobile/mobile_screens.dart';
import 'package:kashflow/screens/splashscreen.dart';
export 'route_names.dart';
export 'routes.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Scaffold(
          body: child,
          /* ... */
          bottomNavigationBar: BottomNavigationBar(
              /* ... */
              ),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => MobileLibraryPage(),
    ),
  ],
);
