import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/db/drift_db.dart';
import 'package:kashflow/util/visible_strings.dart';
import '../../providers/providers.dart';

class DefaultCurrencyTile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      //leading: Icon(Icons.),
      title: Text(DEFAULT_CURRENCY),
      //subtitle: Text(_getWidgetString(_themeMode)),
      onTap: (() async {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Theme.of(context).dialogBackgroundColor,
              title: Text(SELECT_DEFAULT_CURRENCY),
              actions: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: Text(DONE_ALL_CAPS_STRING),
                )
              ],
              content: _SelectCurrencyDetails(),
            );
          },
        );
      }),
    );
  }
}

class _SelectCurrencyDetails extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectCurrencyDialogState();
}

class _SelectCurrencyDialogState extends ConsumerState<_SelectCurrencyDetails> {
  TextEditingController _searchBarController = TextEditingController();
  late final List<PreloadedCurrencyData> _defaultCurrency;
  List<PreloadedCurrencyData> _searchResultsDefaultCurrency = [];

  @override
  void initState() {
    super.initState();
    _defaultCurrency = ref.read(
        settingsProvider.select((settings) => settings.defaultCurrencies));
    _searchResultsDefaultCurrency = _defaultCurrency;
  }

  void _searchAllCurrencies(String searchText) {
    _searchPopularCurrency(searchText);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //search bar
          TextField(
            controller: _searchBarController,
            autocorrect: false,
            onChanged: _searchAllCurrencies,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search_rounded),
              hintText: CURRENCY_PICKER_HINT,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          SizedBox(height: 16),

          //results
          Expanded(
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
          )
        ],
      ),
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
