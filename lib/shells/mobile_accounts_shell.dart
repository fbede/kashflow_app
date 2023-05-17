// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../components/components.dart';
import '../util/visible_strings.dart';

class MobileAccountsShell extends StatelessWidget {
  const MobileAccountsShell({
    super.key,
  });

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(ACCOUNTS_LABEL),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          bottom: const TabBar(
            tabs: [
              Tab(text: CASH_LABEL),
              Tab(text: LOANS_LABEL),
              Tab(text: BALANCE_LABEL),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LoansView(),
            TimelineView(),
            LoansView(),
          ],
        ),
      ),
    );
}
