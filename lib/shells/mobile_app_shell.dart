import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/router/app_router.dart';
import 'package:kashflow/util/strings.dart';

class MobileAppShell extends StatelessWidget {
  final Widget child;

  const MobileAppShell({required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: child,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: NavigationBar(
          height: 70,
          selectedIndex: _getSelectedIndex(context),
          onDestinationSelected: (value) => _onItemTapped(value, context),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: HOME_LABEL,
            ),
            NavigationDestination(
              icon: Icon(Icons.list),
              label: ACCOUNTS_LABEL,
            ),
            NavigationDestination(
              icon: SizedBox.shrink(),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.description),
              label: REPORTS_LABEL,
            ),
            NavigationDestination(
              icon: Icon(Icons.more_horiz),
              label: MORE_LABEL,
            ),
          ],
        ),
      ),
    );
  }

  static int _getSelectedIndex(BuildContext context) {
    String location = GoRouterState.of(context).location;
    if (location.contains(DASHBOARD_ROUTE) ||
        location.contains(TIMELINE_ROUTE)) {
      return 0;
    }
    if (location.contains(ACCOUNT_ROUTE)) {
      return 1;
    }
    if (location.contains(REPORT_ROUTE)) {
      return 3;
    }
    if (location.contains(MORE_ROUTE)) {
      return 4;
    }

    return 5;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(DASHBOARD_ROUTE);
        break;
      case 1:
        context.go(ACCOUNT_ROUTE);
        break;
      case 3:
        context.go(REPORT_ROUTE);
        break;
      case 4:
        context.go(MORE_ROUTE);
        break;
    }
  }
}
