import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/core.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final userText = context.t.onboarding_module.mobile_app_shell;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 500),
        selectedIndex: _getSelectedIndex(context),
        onDestinationSelected: (value) => _onItemTapped(value, context),
        destinations: [
          NavigationDestination(
            icon: const Icon(LucideIcons.home),
            selectedIcon: const Icon(LucideIcons.home),
            label: userText.nav_bar_home,
          ),
          NavigationDestination(
            icon: const Icon(LucideIcons.receiptText),
            selectedIcon: const Icon(LucideIcons.receiptText),
            label: userText.nav_bar_records,
          ),
          NavigationDestination(
            icon: const Icon(LucideIcons.ellipsis),
            selectedIcon: const Icon(LucideIcons.ellipsis),
            label: userText.nav_bar_more,
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
