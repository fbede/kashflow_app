import 'package:flutter/material.dart';

import '../shared/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final _controller = TabController(length: 2, vsync: this);

  String index = '0';
  int intIndex = 1;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      index = _controller.index.toString();
      intIndex = _controller.index + 1;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            _HomeAppBar(
              balanceAmount: index,
              balanceChange: index,
              controller: _controller,
              randomInt: intIndex,
              title: index,
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _controller,
                children: const [Text('1'), Text('2')],
              ),
            )
          ],
        ),
      );
}

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar({
    required this.controller,
    required this.randomInt,
    required this.title,
    required this.balanceAmount,
    required this.balanceChange,
  }) : assert(randomInt != 0, 'Any randomInt except zero');

  final TabController controller;
  final int randomInt;
  final String title;
  final String balanceAmount;
  final String balanceChange;
  final _duration = midGlobalAnimationDuration;

  @override
  Widget build(BuildContext context) => SliverAppBar(
        centerTitle: true,
        expandedHeight: 178,
        pinned: true,
        stretch: true,
        title: AnimatedSwitcher(
          duration: _duration,
          child: Text(
            title,
            key: ValueKey(randomInt),
            style: const TextStyle(fontSize: 16, height: 1),
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50),
              AnimatedSwitcher(
                duration: _duration,
                child: Text(
                  balanceAmount,
                  key: ValueKey(randomInt),
                  style: const TextStyle(
                    height: 1,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              AnimatedSwitcher(
                duration: _duration,
                child: Text(
                  balanceChange,
                  key: ValueKey(randomInt),
                  style: const TextStyle(height: 1, fontSize: 16),
                ),
              )
            ],
          ),
        ),
        bottom: TabBar(
          controller: controller,
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w200, fontSize: 16),
          tabs: const [Tab(text: 'Cash'), Tab(text: 'Portfoilo')],
        ),
      );
}
