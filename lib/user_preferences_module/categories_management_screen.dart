import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ui_elements/user_text.dart';

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
              Tab(text: UserText.expenseCategories),
              Tab(text: UserText.incomeCategories)
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
        floatingActionButton: FloatingActionButton(
          // child: const Icon(PhosphorIconsRegular.plus),
          onPressed: () {},
        ),

        /*  SpeedDial(
          activeIcon: PhosphorIconsRegular.x,
          icon: PhosphorIconsRegular.plus,
          overlayOpacity: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          spaceBetweenChildren: 4,
          spacing: 8,
          children: [
            _buildSpeedDialChild(
              context,
              text: 'Add A Record',
              iconData: PhosphorIcons.fill.pencilSimple,
            ),
            _buildSpeedDialChild(
              context,
              text: 'Add An Account',
              iconData: PhosphorIcons.fill.listPlus,
              onTap: () async => showDialog(
                context: context,
                builder: (_) => const CreateAccountView(),
              ),
            ),
          ],
        ), */
      );
}
