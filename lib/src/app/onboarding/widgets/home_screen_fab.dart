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
  Widget build(BuildContext context, WidgetRef ref) {
    final showMultipleFAB = ref.watch(
      accountsProvider
          .select((value) => value.hasValue && value.requireValue.isNotEmpty),
    );

    if (showMultipleFAB) {}

    return buildFAB(context, ref);
  }

  Widget buildFAB(BuildContext context, WidgetRef ref) =>
      ref.watch(homeScreenFABDataProvider).when(
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
                onPressed = () async => openCreateAccount(context, ref, data);
              }

              return FloatingActionButton(
                onPressed: onPressed,
                child: icon,
              );
            },
          );

  Future<void> openCreateAccount(
    BuildContext context,
    WidgetRef ref,
    HomeScreenFABData data,
  ) async =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useRootNavigator: true,
        builder: (ctx) => AnimatedPadding(
          duration: fastGlobalAnimationDuration,
          padding: EdgeInsetsDirectional.only(
            bottom: ctx.viewInsets.bottom,
          ),
          child: CreateAccountView(data.currency!, data.icon),
        ),
      );
}
