import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/components/components.dart';
import 'package:kashflow/components/onboarding_view.dart';
import 'package:kashflow/router/routes.dart';
import 'package:kashflow/screens/screens.dart';
import 'package:kashflow/shells/shells.dart';

import '../screens/mobile/mobile_screens.dart';

export 'routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _appNavBarNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final GlobalKey<NavigatorState> _mobileDashNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'mobile_dash');

//TODO: Add redirection rules

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: SPLASH_ROUTE,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: ONBOARDING_ROUTE,
      builder: (context, state) => OnboardingView(),
    ),

    //TODO: Create actual pages
    //Authentication Route
    GoRoute(
      path: SIGN_IN_ROUTE,
      builder: (context, state) => SignInView(),
    ),
    GoRoute(
      path: SIGN_UP_ROUTE,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: CONFIRM_EMAIL_ROUTE,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: FORGOT_PASSWORD_ROUTE,
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
    builder: (BuildContext context, GoRouterState state) {
      return Scaffold();
    },
  ),
  GoRoute(
    path: ACCOUNT_ROUTE,
    builder: (BuildContext context, GoRouterState state) {
      return const MobileAccountsShell();
    },
  ),
  //TODO: Change to Transcation Route
  GoRoute(
    path: TRANSACTIONS_ROUTE,
    builder: (BuildContext context, GoRouterState state) {
      return const MobileTransactionsShell();
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
      return const MobileSettingsPage();
    },
  ),
];
