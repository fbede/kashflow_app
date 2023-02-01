import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/components/components.dart';
import 'package:kashflow/components/onboarding_view.dart';
import 'package:kashflow/screens/screens.dart';
import 'package:kashflow/shells/shells.dart';

import '../screens/mobile/mobile_screens.dart';

part 'routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _appNavBarNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

//TODO: Add redirection rules

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: SPLASH_ROUTE,
      name: SPLASH_ROUTE,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: ONBOARDING_ROUTE,
      name: ONBOARDING_ROUTE,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => OnboardingView(),
    ),

    //TODO: Create actual pages
    //Authentication Route
    GoRoute(
      path: SIGN_IN_ROUTE,
      name: SIGN_IN_ROUTE,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => SignInView(),
    ),
    GoRoute(
      path: SIGN_UP_ROUTE,
      name: SIGN_UP_ROUTE,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: CONFIRM_EMAIL_ROUTE,
      name: CONFIRM_EMAIL_ROUTE,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: FORGOT_PASSWORD_ROUTE,
      name: FORGOT_PASSWORD_ROUTE,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => SplashScreen(),
    ),
    ShellRoute(
      navigatorKey: _appNavBarNavigatorKey,
      routes: _mainAppRoutes,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MobileAppShell(child: child);
      },
    ),
  ],
);

//These are the apps main routes that are found on the dashboard or home page
final _mainAppRoutes = <RouteBase>[
  GoRoute(
    path: DASHBOARD_ROUTE,
    name: DASHBOARD_ROUTE,
    parentNavigatorKey: _appNavBarNavigatorKey,
    builder: (BuildContext context, GoRouterState state) {
      return Scaffold();
    },
  ),
  GoRoute(
    path: ACCOUNT_ROUTE,
    name: ACCOUNT_ROUTE,
    parentNavigatorKey: _appNavBarNavigatorKey,
    builder: (BuildContext context, GoRouterState state) {
      return const MobileAccountsShell();
    },
  ),
  GoRoute(
    path: TRANSACTIONS_ROUTE,
    name: TRANSACTIONS_ROUTE,
    parentNavigatorKey: _appNavBarNavigatorKey,
    builder: (BuildContext context, GoRouterState state) {
      return const MobileRecordsShell();
    },
  ),
  GoRoute(
    path: REPORT_ROUTE,
    name: REPORT_ROUTE,
    parentNavigatorKey: _appNavBarNavigatorKey,
    builder: (BuildContext context, GoRouterState state) {
      return const SizedBox();
    },
  ),
  GoRoute(
    path: MORE_ROUTE,
    name: MORE_ROUTE,
    parentNavigatorKey: _appNavBarNavigatorKey,
    builder: (BuildContext context, GoRouterState state) {
      return const MobileSettingsScreen();
    },
  ),
];
