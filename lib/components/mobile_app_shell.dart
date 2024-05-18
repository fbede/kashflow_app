import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../icons_module/icons.dart';
import '../src/shared/extensions/build_context_extensions.dart';
import '../src/core/routing/route_names.dart';
import '../user_text.dart';

class MobileAppShell extends StatelessWidget {
  final Widget child;

  const MobileAppShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final iconColor = context.theme.colorScheme.onPrimary;
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 500),
        selectedIndex: _getSelectedIndex(context),
        onDestinationSelected: (value) => _onItemTapped(value, context),
        destinations: [
          NavigationDestination(
            icon: const Icon(RemixIcons.home_4_line),
            selectedIcon: Icon(
              RemixIcons.home_2_fill,
              color: iconColor,
            ),
            label: UserText.homeNavBarHome,
          ),
          NavigationDestination(
            icon: const Icon(RemixIcons.receipt_line),
            selectedIcon: Icon(
              RemixIcons.receipt_fill,
              color: iconColor,
            ),
            label: UserText.homeNavBarRecords,
          ),
          NavigationDestination(
            icon: const Icon(RemixIcons.settings_4_line),
            selectedIcon: Icon(
              RemixIcons.settings_4_fill,
              color: iconColor,
            ),
            label: UserText.homeNavBarSettings,
          ),
        ],
      ),
    );
  }

  static int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.contains(Routes.dashboard)) {
      return 0;
    }
    if (location.contains(Routes.records)) {
      return 1;
    }
    if (location.contains(Routes.other)) {
      return 2;
    }

    return 3;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(Routes.dashboard);
      case 1:
        context.go(Routes.records);
      case 2:
        context.go(Routes.other);
    }
  }
}
