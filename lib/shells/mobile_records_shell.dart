// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../components/components.dart';
import '../util/visible_strings.dart';

class MobileRecordsShell extends StatelessWidget {
  const MobileRecordsShell({
    super.key,
  });

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(RECORDS_LABEL),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          bottom: const TabBar(
            tabs: [
              Tab(text: RECENT_LABEL),
              Tab(text: UPCOMING_LABEL),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LoansView(),
            TimelineView(),
          ],
        ),
      ),
    );
}
