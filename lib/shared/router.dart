import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../onboarding/onboarding_screen.dart';
import '../onboarding/splashscreen.dart';
import '../shells/mobile_accounts_shell.dart';
import '../shells/mobile_app_shell.dart';
import '../shells/mobile_records_shell.dart';
import 'log_handler.dart';
import 'route_names.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _appNavBarNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

GoRouter getRouter() => GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: Routes.splash,
      observers: [
        TalkerRouteObserver(LoggerBuilder.build()),
      ],
      routes: _baseRoutes,
    );

final _baseRoutes = <RouteBase>[
  GoRoute(
    path: Routes.splash,
    name: Routes.splash,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: Routes.onboarding,
    name: Routes.onboarding,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (context, state) => const OnboardingScreen(),
  ),

  //TODO: Rewrite AppShell
  ShellRoute(
    navigatorKey: _appNavBarNavigatorKey,
    routes: _mainAppRoutes,
    builder: (context, state, child) => MobileAppShell(child: child),
  ),
];

final _mainAppRoutes = <RouteBase>[
  GoRoute(
    path: Routes.home,
    name: Routes.home,
    parentNavigatorKey: _appNavBarNavigatorKey,
    redirect: (_, __) => DASHBOARD_ROUTE,
  ),
  GoRoute(
    path: DASHBOARD_ROUTE,
    name: DASHBOARD_ROUTE,
    parentNavigatorKey: _appNavBarNavigatorKey,
    builder: (context, state) => const Scaffold(),
  ),
  GoRoute(
    path: ACCOUNT_ROUTE,
    name: ACCOUNT_ROUTE,
    parentNavigatorKey: _appNavBarNavigatorKey,
    builder: (context, state) => const MobileAccountsShell(),
  ),
  GoRoute(
    path: TRANSACTIONS_ROUTE,
    name: TRANSACTIONS_ROUTE,
    parentNavigatorKey: _appNavBarNavigatorKey,
    builder: (context, state) => const MobileRecordsShell(),
  ),
  GoRoute(
    path: REPORT_ROUTE,
    name: REPORT_ROUTE,
    parentNavigatorKey: _appNavBarNavigatorKey,
    builder: (context, state) => const SizedBox(),
  ),
  GoRoute(
    path: MORE_ROUTE,
    name: MORE_ROUTE,
    parentNavigatorKey: _appNavBarNavigatorKey,
    builder: (context, state) => const SizedBox(),
  ),
];
