import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../components/fade_on_scroll.dart';
import '../components/other_widgets.dart';
import '../currency_module/currency_provider.dart';
import '../shared/extensions/build_context_extensions.dart';
import '../ui_elements/themes.dart';
import '../ui_elements/user_text.dart';
import 'account_provider.dart';
import 'create_account_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  final _scrollController = ScrollController();

  String title = UserText.homeTabPocketMoney;
  int intIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        title = UserText.homeTabPocketMoney;
      } else {
        title = UserText.homeTabNetWorth;
      }

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
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            _HomeAppBar(
              scrollController: _scrollController,
              balanceAmount: title,
              balanceChange: title,
              tabController: _tabController,
              randomInt: intIndex,
              title: title,
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  _AccountsTabBody(),
                  UnderConstructionWidget(),
                ],
              ),
            ),
          ],
        ),
      );
}

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar({
    required this.tabController,
    required this.scrollController,
    required this.randomInt,
    required this.title,
    required this.balanceAmount,
    required this.balanceChange,
  }) : assert(randomInt != 0, 'Any randomInt except zero');

  final TabController tabController;
  final ScrollController scrollController;
  final int randomInt;
  final String title;
  final String balanceAmount;
  final String balanceChange;
  final _duration = fastGlobalAnimationDuration;
  final _appBarHeight = 188.0;

  @override
  Widget build(BuildContext context) => SliverAppBar(
        centerTitle: true,
        expandedHeight: _appBarHeight,
        pinned: true,
        stretch: true,
        scrolledUnderElevation: 0,
        title: AnimatedSwitcher(
          duration: _duration,
          child: FadeOnScroll(
            scrollController: scrollController,
            fullOpacityOffset: _appBarHeight,
            key: ValueKey(randomInt),
            child: Text(title),
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: AnimatedSwitcher(
            duration: _duration,
            child: _AppBarBackgroudText(
              key: ValueKey(randomInt),
              zeroOpacityOffset: _appBarHeight,
              scrollController: scrollController,
              balanceChange: balanceChange,
              title: title,
              balanceAmount: balanceAmount,
            ),
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          labelStyle: const TextStyle(fontSize: 16),
          unselectedLabelStyle: const TextStyle(fontSize: 16),
          tabs: const [
            Tab(text: UserText.homeTabBarPurse),
            Tab(text: UserText.homeTabBarPortfoilo),
          ],
        ),
      );
}

class _AppBarBackgroudText extends StatelessWidget {
  const _AppBarBackgroudText({
    required this.balanceChange,
    required this.title,
    required this.balanceAmount,
    required this.scrollController,
    super.key,
    this.zeroOpacityOffset = 0,
  });

  final String balanceChange;
  final String title;
  final String balanceAmount;
  final ScrollController scrollController;
  final double zeroOpacityOffset;

  @override
  Widget build(BuildContext context) => FadeOnScroll(
        scrollController: scrollController,
        zeroOpacityOffset: zeroOpacityOffset,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(
                title,
                style: context.textTheme.bodyLarge?.copyWith(height: 1),
              ),
              const SizedBox(height: 16),
              Text(
                balanceAmount,
                style: context.textTheme.headlineLarge?.copyWith(height: 1),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: context.textTheme.bodyLarge?.copyWith(height: 1),
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      );
}

class _AccountsTabBody extends ConsumerWidget {
  const _AccountsTabBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(accountProvider).when(
            loading: () => const Center(child: CustomProgressIndicator()),
            error: (e, s) => Center(child: Text('$e\n$s')),
            data: (data) {
              if (data.isEmpty) {
                return const _AddNewAccountButton();
              }

              return ListView.builder(
                itemCount: data.length + 1,
                itemBuilder: (ctx, index) {
                  if (index < data.length) {
                    return data[index].buildListTile(ctx);
                  }
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: _AddNewAccountButton(),
                  );
                },
              );
            },
          );
}

class _AddNewAccountButton extends ConsumerWidget {
  const _AddNewAccountButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(defaultCurrencyProvider).when(
            error: (e, s) => Center(child: Text('$e\n$s')),
            loading: () => const Center(child: CustomProgressIndicator()),
            data: (data) => Center(
              child: FilledButton.tonalIcon(
                onPressed: () async => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useRootNavigator: true,
                  showDragHandle: true,
                  builder: (ctx) => AnimatedPadding(
                    duration: fastGlobalAnimationDuration,
                    curve: Curves.easeOut,
                    padding: EdgeInsetsDirectional.only(
                      bottom: ctx.viewInsets.bottom,
                    ),
                    child: CreateAccountView(data),
                  ),
                ),
                icon: const PhosphorIcon(PhosphorIconsRegular.bank),
                label: const Text(UserText.addNewAccount),
              ),
            ),
          );
}
