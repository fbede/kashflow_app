import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../account_module/account_provider.dart';
import '../shared/route_names.dart';
import '../ui_elements/user_text.dart';
import 'other_widgets.dart';

class MobileAppShell extends StatelessWidget {
  final Widget child;

  const MobileAppShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: child,
        floatingActionButton: _buildFAB(context),
        bottomNavigationBar: NavigationBar(
          animationDuration: const Duration(milliseconds: 500),
          selectedIndex: _getSelectedIndex(context),
          onDestinationSelected: (value) => _onItemTapped(value, context),
          destinations: const [
            NavigationDestination(
              icon: Icon(PhosphorIconsRegular.house),
              selectedIcon: Icon(PhosphorIconsFill.house),
              label: UserText.homeNavBarHome,
            ),
            NavigationDestination(
              icon: Icon(PhosphorIconsRegular.receipt),
              selectedIcon: Icon(PhosphorIconsFill.receipt),
              label: UserText.homeNavBarRecords,
            ),
            NavigationDestination(
              icon: Icon(PhosphorIconsRegular.gearSix),
              selectedIcon: Icon(PhosphorIconsFill.gearSix),
              label: UserText.homeNavBarSettings,
            ),
          ],
        ),
      );

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

  Widget? _buildFAB(BuildContext context) {
    final index = _getSelectedIndex(context);
    if (index < 2) {
      return _MobileAppShellFAB();
    }
    return null;
  }
}

class _MobileAppShellFAB extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(accountProvider).when(
            loading: () => const Center(child: CustomProgressIndicator()),
            error: (e, s) => Center(child: Text('$e\n$s')),
            data: (data) {
              if (data.isEmpty) {
                return const SizedBox.shrink();
              }
              return FloatingActionButton(
                ///TODO: Add Create Transaction Here
                onPressed: () {},
                child: const PhosphorIcon(
                  PhosphorIconsDuotone.pencilSimpleLine,
                  duotoneSecondaryOpacity: 1,
                ),
              );
            },
          );
}
