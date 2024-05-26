import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    required this.tabController,
    required this.scrollController,
    required this.randomInt,
    super.key,
  }) : assert(randomInt != 0, 'Any randomInt except zero');

  final TabController tabController;
  final ScrollController scrollController;
  final int randomInt;
  final _duration = fastGlobalAnimationDuration;

  @override
  Widget build(BuildContext context) {
    final text = context.t.onboarding_module.home_screen;
    final title = tabController.index == 0 ? text.balance : text.net_worth;
    final appBarHeight = context.screenSize.height / 4 + 64;

    return SliverAppBar(
      centerTitle: true,
      expandedHeight: appBarHeight,
      pinned: true,
      stretch: true,
      scrolledUnderElevation: 0,
      title: AnimatedSwitcher(
        duration: _duration,
        child: FadeOnScroll(
          scrollController: scrollController,
          fullOpacityOffset: appBarHeight,
          key: ValueKey(randomInt),
          child: Text(title),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: AnimatedSwitcher(
          duration: _duration,
          child: _AppBarBackgroudText(
            key: ValueKey(randomInt),
            zeroOpacityOffset: appBarHeight,
            scrollController: scrollController,
            title: title,
            currentIndex: 0,
          ),
        ),
      ),
      bottom: TabBar(
        controller: tabController,
        tabs: [
          Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(LucideIcons.wallet),
                const SizedBox(width: 8),
                Text(text.purse),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(LucideIcons.lineChart),
                const SizedBox(width: 8),
                Text(text.portfoilo),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarBackgroudText extends StatelessWidget {
  const _AppBarBackgroudText({
    required this.title,
    required this.scrollController,
    required this.currentIndex,
    super.key,
    this.zeroOpacityOffset = 0,
  });

  final int currentIndex;
  final String title;
  final ScrollController scrollController;
  final double zeroOpacityOffset;

  @override
  Widget build(BuildContext context) => FadeOnScroll(
        scrollController: scrollController,
        zeroOpacityOffset: zeroOpacityOffset,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //   const SizedBox(height: 16),
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
              const SizedBox(height: 32),
            ],
          ),
        ),
      );
}
