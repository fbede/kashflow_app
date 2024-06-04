import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/core.dart';

class HomeTabBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeTabBar({
    required this.tabController,
    super.key,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final text = context.t.onboarding_module.home_screen;
    return TabBar(
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
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
