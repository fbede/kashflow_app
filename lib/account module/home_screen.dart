import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/account%20module/account_provider.dart';
import 'package:kashflow/shared/components/other_widgets.dart';
import 'package:kashflow/shared/elements/themes.dart';
import 'package:kashflow/shared/elements/user_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final _controller = TabController(length: 2, vsync: this);

  String title = UserText.homeTabPocketMoney;

  int intIndex = 1;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.index == 0) {
        title = UserText.homeTabPocketMoney;
      } else {
        title = UserText.homeTabNetWorth;
      }

      intIndex = _controller.index + 1;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            _HomeAppBar(
              balanceAmount: title,
              balanceChange: title,
              controller: _controller,
              randomInt: intIndex,
              title: title,
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _controller,
                children: const [
                  _AccountsTabBody(),
                  UnderConstructionWidget(),
                ],
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
          tabs: const [
            Tab(text: UserText.homeTabBarPurse),
            Tab(text: UserText.homeTabBarPortfoilo)
          ],
        ),
      );
}

class _AccountsTabBody extends ConsumerWidget {
  const _AccountsTabBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(accountsProvider).when(
            loading: () => const Center(child: CustomProgressIndicator()),
            error: (e, _) => Center(child: Text(e.toString())),
            data: (data) {
              if (data.isEmpty) {
                return const NothingFoundWidget(
                  text: UserText.noAccountsFound,
                );
              }

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, index) => data[index].toListTile(),
              );
            },
          );
}
