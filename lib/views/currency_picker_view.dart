import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/db/drift_db.dart';
import 'package:kashflow/util/visible_strings.dart';
import '../../providers/providers.dart';

class CurrencyPickerView extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectCurrencyPickerViewState();
}

class _SelectCurrencyPickerViewState extends ConsumerState<CurrencyPickerView> {
  TextEditingController _searchBarController = TextEditingController();
  late final List<PreloadedCurrencyData> _defaultCurrency;
  List<PreloadedCurrencyData> _searchResultsDefaultCurrency = [];

  @override
  void initState() {
    /* super.initState();
    _defaultCurrency = ref.read(
        settingsProvider.select((settings) => settings.defaultCurrencies));
    _searchResultsDefaultCurrency = _defaultCurrency; */
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
          child: Center(
            child: SingleChildScrollView(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text(
                      OWN_CURRENCIES_LABEL,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    contentPadding: EdgeInsets.all(0),
                  ),

                  //Popular Currencies Section
                  ListTile(
                    title: Text(
                      POPULAR_CURRENCIES_LABEL,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    contentPadding: EdgeInsets.all(0),
                  ),

                  //TODO: Add isolate to build
                  MasonryGridView.builder(
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
                  ),
                  ListTile(
                    title: Text(
                      OTHER_CURRENCIES_LABEL,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    contentPadding: EdgeInsets.all(0),
                  ),
                ],
              ),
            ),
          ),
        ),
        //search bar
        Divider(
          thickness: 0.5,
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: SizedBox(
            height: 40,
            child: TextField(
              keyboardType: TextInputType.text,
              controller: _searchBarController,
              autocorrect: false,
              onChanged: _searchAllCurrencies,
              decoration: InputDecoration(
                contentPadding: EdgeInsetsDirectional.zero,
                prefixIcon: const Icon(Icons.search_rounded),
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

  void _searchPopularCurrency(String searchText) {
    List<PreloadedCurrencyData> results = [];

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
}
