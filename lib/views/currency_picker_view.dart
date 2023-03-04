import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/db/drift_db.dart';
import 'package:kashflow/util/visible_strings.dart';
import 'package:remixicon/remixicon.dart';
import '../../providers/providers.dart';
import '../models/models.dart';

class CurrencyPickerView extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectCurrencyPickerViewState();
}

class _SelectCurrencyPickerViewState extends ConsumerState<CurrencyPickerView> {
  final ScrollController scrollController = ScrollController();
  List<BasicCurrency> _defaultCurrency = [];
  List<BasicCurrency> _searchResultsDefaultCurrency = [];
  List<BasicCurrency> _buffer = [];
  final int itemNum = 20;
  int pageNum = 1;
  bool popCurrencyHasMore = true;

  @override
  void initState() {
    loadPreloadedCurrencies();
    super.initState();
    /*
    _defaultCurrency = ref.read(
        settingsProvider.select((settings) => settings.defaultCurrencies));
    _searchResultsDefaultCurrency = _defaultCurrency; */
  }

  Future<void> loadPreloadedCurrencies() async {
    _defaultCurrency = await _getPreloadedCurriences();
    _searchResultsDefaultCurrency = _defaultCurrency;
    setState(() {});
  }

  void _loadMore() {}

  void _refreshBuffer() {}

  void _searchPopularCurrency(String searchText) {
    List<BasicCurrency> results = [];

    for (var e in _defaultCurrency) {
      if (e.code.toLowerCase().contains(searchText.toLowerCase()) ||
          e.name.toLowerCase().contains(searchText.toLowerCase())) {
        results.add(e);
      }
    }

    setState(() {
      _searchResultsDefaultCurrency = results;
      print(results);
    });
  }

  void _searchAllCurrencies(String searchText) {
    _searchPopularCurrency(searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //results
        Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    switch (index) {
                      case 0:
                        return Text(
                          OWN_CURRENCIES_LABEL,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        );
                      case 1:
                        return ListView.builder(
                            itemCount: 15,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Text(
                                index.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              );
                            });

                      case 2:
                        return Text(
                          POPULAR_CURRENCIES_LABEL,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        );
                      case 3:
                        return MasonryGridView.builder(
                          shrinkWrap: true,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          itemCount: _searchResultsDefaultCurrency.length,
                          gridDelegate:
                              SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 400,
                          ),
                          itemBuilder: (context, index) {
                            var pcs = _searchResultsDefaultCurrency;

                            return DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                              ),
                              child: ListTile(
                                dense: true,
                                leading: Text(pcs[index].code),
                                title: Text(pcs[index].name),
                                trailing: Text(pcs[index].symbol),
                              ),
                            );
                          },
                        );
                      case 4:
                        return Text(
                          OTHER_CURRENCIES_LABEL,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        );
                      //TODO: Modify when there is something to show
                      case 5:
                        return SizedBox.shrink();

                      default:
                        return SizedBox.shrink();
                    }
                  })),
            ),
          ),
        ),

        //search bar
        /*  Divider(
          thickness: 0.5,
        ), */
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: SizedBox(
            height: 40,
            child: TextField(
              keyboardType: TextInputType.text,
              autocorrect: false,
              onChanged: _searchAllCurrencies,
              decoration: InputDecoration(
                contentPadding: EdgeInsetsDirectional.zero,
                prefixIcon: const Icon(Remix.search_line),
                hintText: CURRENCY_PICKER_HINT,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: FilledButton(
            style:
                FilledButton.styleFrom(minimumSize: Size(double.infinity, 40)),
            onPressed: () {},
            child: Text(
              UserText.Choose_Default_Currency,
            ),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}

///Preloads preloaded currencies
Future<List<BasicCurrency>> _getPreloadedCurriences() async {
  final String json =
      await rootBundle.loadString('assets/json/loaded_currencies.json');

  var data = jsonDecode(json) as List;
  print(data);

  return data.map((e) => BasicCurrency.fromJson(e)).toList();
}
