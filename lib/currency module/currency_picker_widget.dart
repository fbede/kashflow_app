import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grouped_scroll_view/grouped_scroll_view.dart';
import 'package:money2/money2.dart';

import '../shared/util_models.dart';
import 'currency_list_provider.dart';

class CurrencyPickerWidget2 extends ConsumerStatefulWidget {
  const CurrencyPickerWidget2({required this.onTap, super.key});

  final void Function(Currency c) onTap;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectCurrencyPickerViewState();
}

class _SelectCurrencyPickerViewState
    extends ConsumerState<CurrencyPickerWidget2> {
  final ScrollController _scrollController = ScrollController();

  bool isFetching = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadNextPage);
  }

  Future<void> _loadNextPage() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (isFetching) return;

      isFetching = true;

      await ref.read(currencyListProvider.notifier).loadNextPage();

      isFetching = false;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GroupedScrollView.grid(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollController: _scrollController,
        gridDelegate: _getGridDelegate(context),
        groupedOptions: _getGroupedScrollViewOptions(),
        data: ref.watch(currencyListProvider).currency,
        headerBuilder: (context) => const SizedBox.shrink(),
        footerBuilder: (context) => const SizedBox.shrink(),
        itemBuilder: (context, item) => _ItemWidget(
          item: item,
          onTap: widget.onTap,
        ),
      );

  SliverGridDelegateWithMaxCrossAxisExtent _getGridDelegate(
    BuildContext context,
  ) =>
      const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        maxCrossAxisExtent: 550,
        mainAxisExtent: 48,
      );

  GroupedScrollViewOptions<Group<Currency>, String>
      _getGroupedScrollViewOptions() => GroupedScrollViewOptions(
            itemGrouper: (group) => group.groupName,
            stickyHeaderBuilder: (_, groupName, __) =>
                _StickyHeaderWidget(groupName: groupName),
          );
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({required this.item, required this.onTap});

  final Group<Currency> item;
  final void Function(Currency c) onTap;

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.zero,
        shadowColor: Colors.transparent,
        elevation: 1,
        child: ListTile(
          dense: true,
          leading: Text(item.object.code),
          title: Text(
            item.object.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(item.object.symbol),
          onTap: () => onTap(item.object),
        ),
      );
}

class _StickyHeaderWidget extends StatelessWidget {
  const _StickyHeaderWidget({required this.groupName});

  final String groupName;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            groupName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
}
