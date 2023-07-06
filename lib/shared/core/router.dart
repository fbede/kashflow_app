import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/account%20module/home_screen.dart';
import 'package:kashflow/onboarding/onboarding_screen.dart';
import 'package:kashflow/onboarding/splashscreen.dart';
import 'package:kashflow/shared/components/mobile_app_shell.dart';
import 'package:kashflow/shared/core/log_handler.dart';
import 'package:kashflow/shared/core/route_names.dart';
import 'package:kashflow/user%20preferences%20module/categories_management_screen.dart';
import 'package:kashflow/user%20preferences%20module/settings_screen.dart';
import 'package:talker_flutter/talker_flutter.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _appNavBarNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.splash,
  observers: [
    TalkerRouteObserver(Logger.instance),
  ],
  routes: _appBaseRoutes,
);

GoRouter getTestRouter({String? initalLocation}) => GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: initalLocation ?? Routes.splash,
      observers: [
        TalkerRouteObserver(Logger.instance),
      ],
      routes: _appBaseRoutes,
    );

final _appBaseRoutes = <RouteBase>[
  GoRoute(
    path: Routes.splash,
    name: Routes.splash,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (_, __) => const SplashScreen(),
  ),
  GoRoute(
    path: Routes.onboarding,
    name: Routes.onboarding,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (_, __) => const OnboardingScreen(),
  ),
  ShellRoute(
    navigatorKey: _appNavBarNavigatorKey,
    routes: _mainAppRoutes,
    builder: (_, __, child) => MobileAppShell(child: child),
  ),
];

final _mainAppRoutes = <RouteBase>[
  GoRoute(
    path: Routes.home,
    name: Routes.home,
    parentNavigatorKey: _appNavBarNavigatorKey,
    redirect: (_, __) => Routes.dashboard,
  ),
  GoRoute(
    path: Routes.dashboard,
    name: Routes.dashboard,
    parentNavigatorKey: _appNavBarNavigatorKey,
    builder: (_, __) => const HomeScreen(),
  ),
  GoRoute(
    path: Routes.records,
    name: Routes.records,
    parentNavigatorKey: _appNavBarNavigatorKey,
    builder: (context, state) => const SizedBox(),
  ),
  GoRoute(
    path: Routes.other,
    name: Routes.other,
    parentNavigatorKey: _appNavBarNavigatorKey,
    routes: _settingsRoutes,
    builder: (context, state) => const SettingsScreen(),
  ),
];

final _settingsRoutes = <RouteBase>[
  GoRoute(
    path: Routes.manageCategories,
    name: Routes.manageCategories,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (_, __) => const CategoriesManagementScreen(),
  ),
];
