import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../account_module/create_account_view.dart';
import '../core/extensions/build_context_extenstions.dart';
import '../core/responsive.dart';
import '../core/route_names.dart';
import '../ui_elements/user_text.dart';

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
              icon: Icon(PhosphorIconsThin.house),
              selectedIcon: Icon(PhosphorIconsFill.house),
              label: UserText.homeNavBarHome,
            ),
            NavigationDestination(
              icon: Icon(PhosphorIconsThin.receipt),
              selectedIcon: Icon(PhosphorIconsFill.receipt),
              label: UserText.homeNavBarRecords,
            ),
            NavigationDestination(
              icon: Icon(PhosphorIconsThin.gearSix),
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
      return SpeedDial(
        activeIcon: PhosphorIconsRegular.x,
        icon: PhosphorIconsRegular.plus,
        overlayOpacity: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        spaceBetweenChildren: 4,
        spacing: 8,
        children: [
          _buildSpeedDialChild(
            context,
            text: 'Add A Record',
            iconData: PhosphorIconsFill.pencilSimple,
          ),
          _buildSpeedDialChild(
            context,
            text: 'Add An Account',
            iconData: PhosphorIconsFill.listPlus,
            onTap: () async => showDialog(
              context: context,
              builder: (_) => const CreateAccountView(),
            ),
          ),
        ],
      );
    }
    return null;
  }

  SpeedDialChild _buildSpeedDialChild(
    BuildContext context, {
    required String text,
    required IconData iconData,
    Key? key,
    void Function()? onTap,
  }) =>
      SpeedDialChild(
        key: key,
        backgroundColor: context.colorScheme.primaryContainer,
        child: Icon(iconData),
        onTap: onTap,
        labelWidget: Padding(
          padding: const EdgeInsets.all(8),
          child: DecoratedBox(
            decoration: context.theme.tooltipTheme.decoration!,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(text, style: context.theme.tooltipTheme.textStyle),
            ),
          ),
        ),
      );
}
