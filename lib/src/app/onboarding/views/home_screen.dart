import 'package:flutter/material.dart';

import '../../app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  final _scrollController = ScrollController();

  int intIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() {
      intIndex = _tabController.index + 1;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (_, __) => [
              HomeAppBar(
                scrollController: _scrollController,
                tabController: _tabController,
                randomInt: intIndex,
              ),
            ],
            body: TabBarView(
              controller: _tabController,
              children: const [
                AccountPurseView(),
                SizedBox(height: 14),
              ],
            ),
          ),
        ),
        floatingActionButton: HomeScreenFAB(controller: _tabController),
      );
}
