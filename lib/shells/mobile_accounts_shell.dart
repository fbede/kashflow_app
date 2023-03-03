// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kashflow/util/visible_strings.dart';

import '../components/components.dart';

class MobileAccountsShell extends StatelessWidget {
  const MobileAccountsShell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(ACCOUNTS_LABEL),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          bottom: TabBar(
            tabs: [
              Tab(text: CASH_LABEL),
              Tab(text: LOANS_LABEL),
              Tab(text: BALANCE_LABEL),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoansView(),
            TimelineView(),
            LoansView(),
          ],
        ),
      ),
    );
  }
}
