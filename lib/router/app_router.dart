import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/components/components.dart';
import 'package:kashflow/onboarding/splashscreen.dart';
import 'package:kashflow/onboarding/welcome_screen.dart';
import 'package:kashflow/router/routes.dart';
import 'package:kashflow/shared/logs/log_handler.dart';
import 'package:kashflow/shells/shells.dart';
import 'package:kashflow/ui/views/views.dart';
import 'package:kashflow/util/visible_strings.dart';
import 'package:talker_flutter/talker_flutter.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _appNavBarNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoute.SPLASH,
  observers: [
    TalkerRouteObserver(AppLogger.start()),
  ],
  routes: [
    GoRoute(
      path: AppRoute.SPLASH,
      name: AppRoute.SPLASH,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoute.ONBOARDING,
      name: AppRoute.ONBOARDING,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoute.CHOOSE_DEFAULT_CURRENCY,
      name: AppRoute.CHOOSE_DEFAULT_CURRENCY,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (_, __) => const CurrencyPickerView(
        titleString: UserText.Choose_Default_Currency,
      ),
    ),
    GoRoute(
      path: AppRoute.CHOOSE_CURRENCY,
      name: AppRoute.CHOOSE_CURRENCY,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const CurrencyPickerView(
        titleString: UserText.Select_Currency,
      ),
    ),
    GoRoute(
      path: AppRoute.EDIT_CURRENCY,
      name: AppRoute.EDIT_CURRENCY,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => EditCurrencyView(
        titleString: UserText.Edit_Currency,
        extra: state.extra,
      ),
    ),
    GoRoute(
      path: AppRoute.CREATE_NEW_CURRENCY,
      name: AppRoute.CREATE_NEW_CURRENCY,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => EditCurrencyView(
        titleString: UserText.Create_New_Currency,
        extra: state.extra,
      ),
    ),

    //TODO: Create actual pages
    //Authentication Route
    GoRoute(
      path: SIGN_IN_ROUTE,
      name: SIGN_IN_ROUTE,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => SignInView(),
    ),

    ShellRoute(
      navigatorKey: _appNavBarNavigatorKey,
      routes: _mainAppRoutes,
      builder: (context, state, child) => MobileAppShell(child: child),
    ),
  ],
);

//These are the apps main routes that are found on the dashboard or home page
final _mainAppRoutes = <RouteBase>[
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
