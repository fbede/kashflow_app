import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'route_names.dart';
import 'user_text.dart';

class MobileAppShell extends StatelessWidget {
  final Widget child;

  const MobileAppShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: child,
          floatingActionButton: _buildFAB(_getSelectedIndex(context)),
          bottomNavigationBar: NavigationBar(
            animationDuration: const Duration(milliseconds: 500),
            selectedIndex: _getSelectedIndex(context),
            onDestinationSelected: (value) => _onItemTapped(value, context),
            destinations: [
              NavigationDestination(
                icon: Icon(PhosphorIcons.light.house),
                selectedIcon: Icon(PhosphorIcons.fill.house),
                label: UserText.homeNavBarHome,
              ),
              NavigationDestination(
                icon: Icon(PhosphorIcons.light.receipt),
                selectedIcon: Icon(PhosphorIcons.fill.receipt),
                label: UserText.homeNavBarRecords,
              ),
              NavigationDestination(
                icon: Icon(PhosphorIcons.light.dotsThreeOutline),
                selectedIcon: Icon(PhosphorIcons.fill.dotsThreeOutline),
                label: UserText.homeNavBarOther,
              ),
            ],
          ),
        ),
      );

  static int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
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
        break;
      case 1:
        context.go(Routes.records);
        break;
      case 2:
        context.go(Routes.other);
        break;
    }
  }

  FloatingActionButton? _buildFAB(int index) {
    if (index < 2) {
      return FloatingActionButton(onPressed: () {});
    }
    return null;
  }
}
