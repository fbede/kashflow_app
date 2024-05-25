import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../shared/extensions/build_context_extensions.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final userText = context.t.onboarding_module.mobile_app_shell;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 500),
        selectedIndex: _getSelectedIndex(context),
        onDestinationSelected: (value) => _onItemTapped(value, context),
        destinations: [
          NavigationDestination(
            icon: Assets.lucide.home.svg(
              theme: SvgTheme(currentColor: colorScheme.onBackground),
            ),
            selectedIcon: Assets.lucide.home.svg(
              theme: SvgTheme(currentColor: colorScheme.primaryContainer),
            ),
            label: userText.nav_bar_home,
          ),
          NavigationDestination(
            icon: Assets.lucide.receiptText.svg(
              theme: SvgTheme(currentColor: colorScheme.onBackground),
            ),
            selectedIcon: Assets.lucide.receiptText.svg(
              theme: SvgTheme(currentColor: colorScheme.primaryContainer),
            ),
            label: userText.nav_bar_records,
          ),
          NavigationDestination(
            icon: Assets.lucide.menu.svg(
              theme: SvgTheme(currentColor: colorScheme.onBackground),
            ),
            selectedIcon: Assets.lucide.menu.svg(
              theme: SvgTheme(currentColor: colorScheme.primaryContainer),
            ),
            label: userText.nav_bar_settings,
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
