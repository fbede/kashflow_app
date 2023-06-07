import 'dart:async';

import 'package:flutter/material.dart';
import 'package:money2/money2.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../elements/elements.dart';
import '../shared/constants.dart';
import '../shared/log_handler.dart';
import '../shared/responsive.dart';
import '../shared/user_text.dart';
import 'asset_currency_service.dart';

class CurrencyPickerBody extends StatefulWidget {
  const CurrencyPickerBody({
    required this.onTap,
    required this.textController,
    super.key,
  });

  final void Function(Currency c) onTap;
  final TextEditingController textController;

  @override
  State<CurrencyPickerBody> createState() => _CurrencyPickerBodyState();
}

class _CurrencyPickerBodyState extends State<CurrencyPickerBody> {
  final _scrollController = ScrollController();
  final _currencyService = AssetCurrencyService();

  List<Currency> _assetCurrencies = [];

  String _searchTerm = '';

  bool _assetIsFetching = false;
  bool _assetListIsExhausted = false;

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
            currencies: _assetCurrencies,
            listIsExhausted: _assetListIsExhausted,
            onTap: widget.onTap,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                UserText.savedCurriences,
                style: context.theme().textTheme.titleSmall,
              ),
            ),
          ),
        ],
      );

  Future<void> _fetchAssetCurrencies() async {
    if (_assetIsFetching || _assetListIsExhausted) return;
    _assetIsFetching = true;

    try {
      final newItems = await _currencyService.loadPage(
        searchTerm: _searchTerm,
        pageNumber: _assetPageNumber,
        pageSize: defaultPageSize,
      );

      final isLastPage = newItems.length < defaultPageSize;

      if (isLastPage) {
        _assetListIsExhausted = true;
      } else {
        _assetPageNumber++;
      }

      _assetCurrencies.addAll(newItems);
    } on Exception catch (e, s) {
      LogHandler().onException(TalkerException(e, stackTrace: s));
    } finally {
      _assetIsFetching = false;
      setState(() {});
    }
  }

  Future<void> _firstLoad() async {
    await _fetchAssetCurrencies();

    if (_assetListIsExhausted) return;

    if (_scrollController.position.maxScrollExtent > 0) return;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => Future.delayed(Duration.zero, () async => _firstLoad()),
    );
  }

  Future<void> search() async {
    _searchTerm = widget.textController.text;
    reset();
    await _firstLoad();
  }

  void reset() {
    _assetListIsExhausted = false;
    _assetPageNumber = defaultFirstPageIndex;
    _assetCurrencies = [];
  }
}

class _AssetCurrencyList extends StatelessWidget {
  const _AssetCurrencyList({
    required this.currencies,
    required this.listIsExhausted,
    required this.onTap,
  });

  final List<Currency> currencies;
  final bool listIsExhausted;
  final ValueChanged<Currency> onTap;

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

  final Currency item;
  final void Function(Currency c) onTap;

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
