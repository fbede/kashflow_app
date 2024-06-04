import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';

class HomeAppBarBackgroud extends StatelessWidget {
  const HomeAppBarBackgroud({
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
                end: const Offset(-2, 0),
              ),
            ),
          ),
          child: _AppBarBackgroundText(title: text.balance),
        ),
        SlideTransition(
          position: Animation.fromValueListenable(
            tabController.animation!.drive(
              Tween(begin: const Offset(2, 0), end: Offset.zero),
            ),
          ),
          child: _AppBarBackgroundText(title: text.net_worth),
        ),
      ],
    );
  }
}

class _AppBarBackgroundText extends StatelessWidget {
  const _AppBarBackgroundText({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title.toUpperCase(),
            style: context.textTheme.titleBold,
          ),
          const SizedBox(height: 16),
          Text(
            'NGN 0.00'.toUpperCase(),
            style: context.textTheme.headlineNormal,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'NGN 200,000,000.00'.toUpperCase(),
            style: context.textTheme.titleNormal,
            textAlign: TextAlign.center,
          ),
        ],
      );
}
