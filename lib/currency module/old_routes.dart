import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/route_names.dart';
import '../util/visible_strings.dart';
import 'currency_picker_view.dart';
import 'edit_currency_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final appRouter = [
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
];
