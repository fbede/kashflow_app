// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kashflow/util/strings.dart';

import '../components/components.dart';

class MobileDashboardShell extends StatelessWidget {
  final int index;
  const MobileDashboardShell({
    Key? key,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: index,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(APPNAME),
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
          bottom: TabBar(
            tabs: [
              Tab(text: DASHBOARD_LABEL),
              Tab(text: TIMELINE_LABEL),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DashboardView(),
            TimelineView(),
          ],
        ),
      ),
    );
  }
}
