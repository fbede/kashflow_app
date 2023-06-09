import 'dart:async';

import 'package:flutter/material.dart';

import '../../elements/elements.dart';
import '../../shared/constants.dart';
import '../../shared/drift_db.dart';
import '../../shared/responsive.dart';
import '../../shared/user_text.dart';
import 'currency_picker_service.dart';

class CurrencyPickerBody extends StatefulWidget {
  const CurrencyPickerBody({
    required this.onTap,
    required this.textController,
    super.key,
  });

  final void Function(CurrencyTableData c) onTap;
  final TextEditingController textController;

  @override
  State<CurrencyPickerBody> createState() => _CurrencyPickerBodyState();
}

class _CurrencyPickerBodyState extends State<CurrencyPickerBody> {
  final _scrollController = ScrollController();
  final _pickerService = CurrencyPickerService();

  List<CurrencyTableData> _assetCurrencies = [];
  List<CurrencyTableData> _savedCurrencies = [];

  String _searchTerm = '';

  bool _assetCurrencyIsFetching = false;
  bool _assetCurrenciesIsExhausted = false;
  bool _savedCurrencyIsFetching = false;
  bool _savedCurrenciesIsExhausted = false;

  int _assetPageNumber = defaultFirstPageIndex;

  @override
  void initState() {
    super.initState();
    widget.textController.addListener(search);
    _scrollController.addListener(_fetchAssetCurrencies);
    WidgetsBinding.instance.addPostFrameCallback((_) async => _firstLoad());
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                UserText.savedCurriences,
                style: context.theme().textTheme.titleSmall,
              ),
            ),
          ),
          _AssetCurrencyList(
            currencies: _savedCurrencies,
            listIsExhausted: _savedCurrenciesIsExhausted,
            onTap: widget.onTap,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                UserText.otherCurriences,
                style: context.theme().textTheme.titleSmall,
              ),
            ),
          ),
          _AssetCurrencyList(
            currencies: _assetCurrencies,
            listIsExhausted: _assetCurrenciesIsExhausted,
            onTap: widget.onTap,
          ),
        ],
      );

  Future<void> _firstLoad() async {
    if (_savedCurrencies.isEmpty) {
      await _fetchSavedCurrencies();
    }

    await _fetchAssetCurrencies();

    if (_assetCurrenciesIsExhausted) return;

    if (_scrollController.position.maxScrollExtent > 0) return;

    WidgetsBinding.instance.addPostFrameCallback((_) async => _firstLoad());
  }

  Future<void> _fetchSavedCurrencies() async {
    if (_savedCurrencyIsFetching || _savedCurrenciesIsExhausted) return;
    _savedCurrencyIsFetching = true;

    _savedCurrencies =
        await _pickerService.loadSavedCurrencies(searchTerm: _searchTerm);
    _savedCurrenciesIsExhausted = true;

    _savedCurrencyIsFetching = false;
    setState(() {});
  }

  Future<void> _fetchAssetCurrencies() async {
    if (_assetCurrencyIsFetching || _assetCurrenciesIsExhausted) return;
    _assetCurrencyIsFetching = true;

    final newItems = await _pickerService.loadOtherCurrencies(
      searchTerm: _searchTerm,
      pageNumber: _assetPageNumber,
      pageSize: defaultPageSize,
    );

    final isLastPage = newItems.length < defaultPageSize;

    if (isLastPage) {
      _assetCurrenciesIsExhausted = true;
    } else {
      _assetPageNumber++;
    }

    _assetCurrencies.addAll(newItems);

    _assetCurrencyIsFetching = false;
    setState(() {});
  }

  Future<void> search() async {
    _searchTerm = widget.textController.text;
    reset();
    await _firstLoad();
  }

  void reset() {
    _assetCurrenciesIsExhausted = false;
    _assetPageNumber = defaultFirstPageIndex;
    _assetCurrencies = [];

    _savedCurrenciesIsExhausted = false;
    _savedCurrencies = [];
  }
}

class _AssetCurrencyList extends StatelessWidget {
  const _AssetCurrencyList({
    required this.currencies,
    required this.listIsExhausted,
    required this.onTap,
  });

  final List<CurrencyTableData> currencies;
  final bool listIsExhausted;
  final ValueChanged<CurrencyTableData> onTap;

  @override
  Widget build(BuildContext context) {
    if (currencies.isEmpty) {
      return const SliverToBoxAdapter(
        child: Text('No items found', textAlign: TextAlign.center),
      );
    }
    return SliverGrid.builder(
      itemCount: currencies.length,
      itemBuilder: (_, index) {
        if (index == currencies.length && !listIsExhausted) {
          return const CustomProgressIndicator();
        }
        return _ItemWidget(item: currencies[index], onTap: onTap);
      },
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        maxCrossAxisExtent: 550,
        mainAxisExtent: 48,
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({required this.item, required this.onTap});

  final CurrencyTableData item;
  final void Function(CurrencyTableData c) onTap;

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.zero,
        shadowColor: Colors.transparent,
        child: ListTile(
          dense: true,
          leading: Text(item.code),
          title: Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(item.symbol),
          onTap: () => onTap(item),
        ),
      );
}
