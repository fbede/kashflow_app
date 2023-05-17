import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../components/components.dart';
import '../ui/views/views.dart';
import '../util/visible_strings.dart';
import 'log_handler.dart';
import 'route_names.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.splash,
  observers: [
    TalkerRouteObserver(LoggerBuilder.build()),
  ],
  routes: [
    GoRoute(
      path: Routes.CHOOSE_DEFAULT_CURRENCY,
      name: Routes.CHOOSE_DEFAULT_CURRENCY,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (_, __) => const CurrencyPickerView(
        titleString: UserText.Choose_Default_Currency,
      ),
    ),
    GoRoute(
      path: Routes.CHOOSE_CURRENCY,
      name: Routes.CHOOSE_CURRENCY,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const CurrencyPickerView(
        titleString: UserText.Select_Currency,
      ),
    ),
    GoRoute(
      path: Routes.EDIT_CURRENCY,
      name: Routes.EDIT_CURRENCY,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => EditCurrencyView(
        titleString: UserText.Edit_Currency,
        extra: state.extra,
      ),
    ),
    GoRoute(
      path: Routes.CREATE_NEW_CURRENCY,
      name: Routes.CREATE_NEW_CURRENCY,
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
      builder: (context, state) => const SignInView(),
    ),
  ],
);

//These are the apps main routes that are found on the dashboard or home page

