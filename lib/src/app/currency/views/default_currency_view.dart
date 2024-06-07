import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../../app.dart' as a;

class DefaultCurrencyView extends ConsumerStatefulWidget {
  const DefaultCurrencyView({super.key});

  @override
  ConsumerState<DefaultCurrencyView> createState() =>
      _DefaultCurrencyViewState();
}

class _DefaultCurrencyViewState extends ConsumerState<DefaultCurrencyView> {
  final scrollController = ScrollController();
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = context.t.currency_module.default_currency;

    return Scaffold(
      body: CustomScrollViewWithFaddingAppBar(
        scrollController: scrollController,
        title: Text(text),
        slivers: [
          ref.watch(a.defaultCurrencyScreenProvider('')).when(
                error: _buildErrorText,
                loading: _buildLoader,
                data: _buildList,
              ),
        ],
      ),
      bottomSheet: SearchTextField(controller: searchController),
    );
  }

  SliverList _buildList((CurrencyTableData?, List<CurrencyTableData>) data) {
    final defaultCurrency = data.$1;
    final currencyList = data.$2;

    return SliverList.builder(
      itemCount: currencyList.length,
      itemBuilder: (_, index) => RadioListTile<CurrencyTableData>(
        title: Text(currencyList[index].name),
        secondary: Text(currencyList[index].symbol),
        value: currencyList[index],
        groupValue: defaultCurrency,
        selected: defaultCurrency == currencyList[index],
        onChanged: _onChanged,
      ),
    );
  }

  Future<void> _onChanged(CurrencyTableData? i) async {
    final notifier = ref.watch(a.defaultCurrencyProvider.notifier);
    if (i != null) {
      await notifier.setDefaultCurrency(i);
    }
  }

  SliverToBoxAdapter _buildErrorText(Object e, StackTrace s) =>
      SliverToBoxAdapter(
        child: Text(e.toString(), textAlign: TextAlign.center),
      );

  SliverToBoxAdapter _buildLoader() =>
      const SliverToBoxAdapter(child: CustomProgressIndicator());
}
