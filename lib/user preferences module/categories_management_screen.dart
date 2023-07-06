import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/shared/elements/user_text.dart';

class CategoriesManagementScreen extends ConsumerStatefulWidget {
  const CategoriesManagementScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoriesManagementScreenState();
}

class _CategoriesManagementScreenState
    extends ConsumerState<CategoriesManagementScreen>
    with TickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(UserText.manageCategories),
          bottom: TabBar(
            controller: _tabController,
            labelStyle:
                const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.w200, fontSize: 16),
            tabs: const [
              Tab(text: UserText.homeTabBarPurse),
              Tab(text: UserText.homeTabBarPortfoilo)
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Text('1'),
            Text('2'),
          ],
        ),
      );
}
