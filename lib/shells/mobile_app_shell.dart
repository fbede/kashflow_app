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
        floatingActionButton: _buildFAB(_getSelectedIndex(context)),
        bottomNavigationBar: NavigationBar(
          height: 70,
          selectedIndex: _getSelectedIndex(context),
          onDestinationSelected: (value) => _onItemTapped(value, context),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              label: HOME_LABEL,
            ),
            NavigationDestination(
              icon: Icon(Icons.format_list_numbered_rounded),
              label: ACCOUNTS_LABEL,
            ),
            NavigationDestination(
              icon: Icon(Icons.receipt_rounded),
              label: RECORDS_LABEL,
            ),
            NavigationDestination(
              icon: Icon(Icons.bar_chart_rounded),
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
    if (location.contains(DASHBOARD_ROUTE)) {
      return 0;
    }
    if (location.contains(ACCOUNT_ROUTE)) {
      return 1;
    }
    if (location.contains(TRANSACTIONS_ROUTE)) {
      return 2;
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
      case 2:
        context.go(TRANSACTIONS_ROUTE);
        break;
      case 3:
        context.go(REPORT_ROUTE);
        break;
      case 4:
        context.go(MORE_ROUTE);
        break;
    }
  }

  FloatingActionButton? _buildFAB(int index) {
    if (index < 4) {
      return FloatingActionButton(onPressed: () {});
    }
    return null;
  }
}
