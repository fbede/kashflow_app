import 'package:flutter/material.dart';

import '../../currency_module/currency.dart';
import '../../shared/extensions/build_context_extensions.dart';
import '../../ui_elements/app_theme.dart';
import 'create_account_view.dart';

Future<void> openCreateAccount(BuildContext context, AppCurrency data) async =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (ctx) => AnimatedPadding(
        duration: fastGlobalAnimationDuration,
        curve: Curves.easeOut,
        padding: EdgeInsetsDirectional.only(
          bottom: ctx.viewInsets.bottom,
        ),
        child: CreateAccountView(data),
      ),
    );
