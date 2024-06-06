import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({
    required this.tabController,
    super.key,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final text = context.t.onboarding_module.home_screen;

    return Stack(
      alignment: Alignment.center,
      children: [
        SlideTransition(
          position: Animation.fromValueListenable(
            tabController.animation!.drive(
              Tween(
                begin: Offset.zero,
                end: const Offset(-3, 0),
              ),
            ),
          ),
          child: Text(
            text.balance.toUpperCase(),
            style: context.textTheme.titleBold.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
        SlideTransition(
          position: Animation.fromValueListenable(
            tabController.animation!.drive(
              Tween(begin: const Offset(3, 0), end: Offset.zero),
            ),
          ),
          child: Text(
            text.net_worth.toUpperCase(),
            style: context.textTheme.titleBold.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
