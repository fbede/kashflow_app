import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/route_names.dart';
import 'currency_picker_view.dart';
import 'edit_currency_view.dart';
import 'util/visible_strings.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final appRouter = [
  GoRoute(
    path: Routes.chooseDefaultCurrency,
    name: Routes.chooseDefaultCurrency,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (_, __) => const CurrencyPickerView(
      titleString: UserText.Choose_Default_Currency,
    ),
  ),
  GoRoute(
    path: Routes.chooseCurrency,
    name: Routes.chooseCurrency,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (context, state) => const CurrencyPickerView(
      titleString: UserText.Select_Currency,
    ),
  ),
  GoRoute(
    path: Routes.editCurrency,
    name: Routes.editCurrency,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (context, state) => EditCurrencyView(
      titleString: UserText.Edit_Currency,
      extra: state.extra,
    ),
  ),
  GoRoute(
    path: Routes.createNewCurrency,
    name: Routes.createNewCurrency,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (context, state) => EditCurrencyView(
      titleString: UserText.Create_New_Currency,
      extra: state.extra,
    ),
  ),
];
