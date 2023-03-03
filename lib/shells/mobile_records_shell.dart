// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kashflow/util/visible_strings.dart';

import '../components/components.dart';

class MobileRecordsShell extends StatelessWidget {
  const MobileRecordsShell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(RECORDS_LABEL),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
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
