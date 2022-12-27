import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/router/routes.dart';
import 'package:kashflow/screens/splashscreen.dart';
import 'package:kashflow/shells/shells.dart';

export 'routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _appNavBarNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> _mobileDashNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'mobile_dash');

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: SPLASH_ROUTE,
      builder: (context, state) => SplashScreen(),
    ),
    ShellRoute(
      navigatorKey: _appNavBarNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MobileAppShell(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: DASHBOARD_ROUTE,
          builder: (BuildContext context, GoRouterState state) {
            return MobileDashboardShell(index: 0);
          },
        ),
        GoRoute(
          path: TIMELINE_ROUTE,
          builder: (BuildContext context, GoRouterState state) {
            return MobileDashboardShell(index: 1);
          },
        ),
        GoRoute(
          path: ACCOUNT_ROUTE,
          builder: (BuildContext context, GoRouterState state) {
            return const SizedBox();
          },
        ),
        GoRoute(
          path: REPORT_ROUTE,
          builder: (BuildContext context, GoRouterState state) {
            return const SizedBox();
          },
        ),
        GoRoute(
          path: MORE_ROUTE,
          builder: (BuildContext context, GoRouterState state) {
            return const SizedBox();
          },
        ),
      ],
    ),
  ],
);
