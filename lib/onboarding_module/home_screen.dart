import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../account_module/account_provider.dart';
import '../account_module/views/account_purse_view.dart';
import '../account_module/views/ui_functions.dart';
import '../components/fade_on_scroll.dart';
import '../components/other_widgets.dart';
import '../currency_module/currency_provider.dart';
import '../i18n/translations.g.dart';
import '../icons_module/icons.dart';
import '../shared/extensions/build_context_extensions.dart';
import '../ui_elements/app_theme.dart';

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
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            _HomeAppBar(
              scrollController: _scrollController,
              tabController: _tabController,
              randomInt: intIndex,
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  AccountPurseView(),
                  UnderConstructionWidget(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: _HomeScreenFAB(controller: _tabController),
      );
}

class _HomeScreenFAB extends ConsumerWidget {
  const _HomeScreenFAB({required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(accountProvider).when(
            loading: () => const Center(child: CustomProgressIndicator()),
            error: (e, s) => Center(child: Text('$e\n$s')),
            data: (data) {
              if (data.isEmpty) {
                return buildFAB(context, ref);
              }

              final text = context.t.onboarding_module.home_screen;
              return FloatingActionButton.extended(
                ///TODO: Add Create Transaction Here
                onPressed: () {},
                label: Text(text.new_record),
                icon: const Icon(RemixIcons.edit_2_line),
              );
            },
          );

  Widget buildFAB(BuildContext context, WidgetRef ref) =>
      ref.watch(defaultCurrencyProvider).when(
            error: (e, s) => Center(child: Text('$e\n$s')),
            loading: () => const Center(child: CustomProgressIndicator()),
            data: (data) {
              late void Function() onPressed;
              late Widget icon;

              if (controller.index == 1) {
                icon = const Icon(RemixIcons.line_chart_line);
                onPressed = () {};
              } else {
                icon = const Icon(RemixIcons.wallet_3_line);
                onPressed = () async => openCreateAccount(context, data);
              }

              return FloatingActionButton(
                onPressed: onPressed,
                child: icon,
              );
            },
          );
}

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar({
    required this.tabController,
    required this.scrollController,
    required this.randomInt,
  }) : assert(randomInt != 0, 'Any randomInt except zero');

  final TabController tabController;
  final ScrollController scrollController;
  final int randomInt;
  final _duration = fastGlobalAnimationDuration;
  final _appBarHeight = 188.0;

  @override
  Widget build(BuildContext context) {
    final text = context.t.onboarding_module.home_screen;
    final title = tabController.index == 0 ? text.balance : text.net_worth;

    return SliverAppBar(
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
            title: title,
            currentIndex: 0,
          ),
        ),
      ),
      bottom: TabBar(
        controller: tabController,
        tabs: [
          Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (tabController.index == 0)
                  const Icon(RemixIcons.wallet_3_fill)
                else
                  const Icon(RemixIcons.wallet_3_line),
                const SizedBox(width: 8),
                Text(text.purse),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (tabController.index == 1)
                  const Icon(RemixIcons.line_chart_fill)
                else
                  const Icon(RemixIcons.line_chart_line),
                const SizedBox(width: 8),
                Text(text.portfoilo),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarBackgroudText extends StatelessWidget {
  const _AppBarBackgroudText({
    required this.title,
    required this.scrollController,
    required this.currentIndex,
    super.key,
    this.zeroOpacityOffset = 0,
  });

  final int currentIndex;
  final String title;
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
                style: context.textTheme.headlineSmall?.copyWith(height: 1),
              ),
              const SizedBox(height: 16),
              Text(
                'ikugi',
                style: context.textTheme.displaySmall?.copyWith(height: 1),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(height: 1),
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      );
}
