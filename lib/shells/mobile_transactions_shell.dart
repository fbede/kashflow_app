// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kashflow/util/strings.dart';

import '../components/components.dart';

class MobileTransactionsShell extends StatelessWidget {
  const MobileTransactionsShell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(TRANSACTIONS_LABEL),
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
          bottom: TabBar(
            tabs: [
              Tab(text: RECENT_LABEL),
              Tab(text: UPCOMING_LABEL),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoansView(),
            TimelineView(),
          ],
        ),
      ),
    );
  }
}
