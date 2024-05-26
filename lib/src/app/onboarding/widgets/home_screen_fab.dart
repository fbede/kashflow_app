import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../../app.dart';

class HomeScreenFAB extends ConsumerWidget {
  const HomeScreenFAB({required this.controller, super.key});

  final TabController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(accountProviderPresenter).when(
            loading: () => const Center(child: CustomProgressIndicator()),
            error: (e, s) => Center(child: Text('$e\n$s')),
            data: (data) {
              if (data.isEmpty) {
                return buildFAB(context, ref);
              }

              final text = context.t.onboarding_module.home_screen;

              return FloatingActionButton.extended(
                ///TODO: Add Create Transaction Here
                onPressed: () {},
                label: Text(text.new_record),
                icon: const Icon(LucideIcons.penLine),
              );
            },
          );

  Widget buildFAB(BuildContext context, WidgetRef ref) =>
      ref.watch(defaultCurrencyProviderPresenter).when(
            error: (e, s) => Center(child: Text('$e\n$s')),
            loading: () => const Center(child: CustomProgressIndicator()),
            data: (data) {
              late void Function() onPressed;
              late Widget icon;

              if (controller.index == 1) {
                icon = const Icon(LucideIcons.lineChart);
                onPressed = () {};
              } else {
                icon = const Icon(LucideIcons.wallet);
                onPressed = () async => openCreateAccount(context, data!);
              }

              return FloatingActionButton(
                onPressed: onPressed,
                child: icon,
              );
            },
          );

  Future<void> openCreateAccount(
    BuildContext context,
    CurrencyTableData data,
  ) async =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useRootNavigator: true,
        builder: (ctx) => AnimatedPadding(
          duration: fastGlobalAnimationDuration,
          padding: EdgeInsetsDirectional.only(
            bottom: ctx.viewInsets.bottom,
          ),
          child: CreateAccountView(data),
        ),
      );
}
