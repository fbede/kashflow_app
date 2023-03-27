import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grouped_scroll_view/grouped_scroll_view.dart';
import 'package:kashflow/ui/elements/elements.dart';
import 'package:kashflow/util/paths.dart';
import 'package:kashflow/util/visible_strings.dart';
import 'package:remixicon/remixicon.dart';
import '../models/models.dart';

class CurrencyPickerView extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectCurrencyPickerViewState();
}

class _SelectCurrencyPickerViewState extends ConsumerState<CurrencyPickerView> {
  late Future<void> _popularCurrencyFuture;
  final _CurrencyPickerController _pickerController =
      _CurrencyPickerController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _pickerController.addListener(() {
      setState(() {});
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          0.8 * _scrollController.position.maxScrollExtent) {
        _pickerController.fetch();
      }
    });
    _pickerController.search();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmallCustomAppBar(
        title: Text(UserText.Choose_Default_Currency),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: GroupedScrollView.grid(
          scrollController: _scrollController,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            maxCrossAxisExtent: 360 * 1.3,
            childAspectRatio: 10,
          ),
          groupedOptions: GroupedScrollViewOptions(
            itemGrouper: (Group<BasicCurrency> group) => group.groupName,
            stickyHeaderBuilder:
                (BuildContext context, String groupName, int groupedIndex) {
              return Text(
                '$groupName',
                style: const TextStyle(fontWeight: FontWeight.bold),
              );
            },
          ),
          itemBuilder: (BuildContext context, Group<BasicCurrency> item) {
            return ListTile(
              leading: Text(item.object.code),
              title: Text(item.object.name),
              trailing: Text(item.object.symbol),
            );
          },
          data: _pickerController.data,
          headerBuilder: (BuildContext context) => SizedBox.shrink(),
          footerBuilder: (BuildContext context) => SizedBox.shrink(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 12),
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onChanged: (v) => _pickerController.search(text: v),
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsetsDirectional.zero,
                    prefixIcon: const Icon(Remix.search_line),
                    hintText: CURRENCY_PICKER_HINT,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              FloatingActionButton.small(
                elevation: 0,
                child: Icon(Remix.add_fill),
                onPressed: () {},
                shape: CircleBorder(eccentricity: 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Update to fetch from web & db
class _CurrencyPickerController extends ChangeNotifier {
  final pageSize = 30;
  int pageNumber = 1;

  bool isLoading = false;
  //bool loadFromDBIsLoading = false;
  //bool loadFromAssestsIsLoading = false;
  //bool loadFromWebIsLoading = false;

  bool dbCurrencyHasFinished = false;
  bool assetCurrencyHasFinished = false;
  bool pbCurrencyHasFinished = false;

  int dbCurrencyIndex = 0;
  int assetCurrencyIndex = 0;
  int pbCurrencyIndex = 0;

  List<Group<BasicCurrency>> data = [];

  List<Group<BasicCurrency>> dBCurrencies = [];
  List<Group<BasicCurrency>> assetCurrencies = [];
  List<Group<BasicCurrency>> pbCurrencies = [];

  void search({String text = ''}) async {
    isLoading = true;
    notifyListeners();
    reset();
    await _getCurriencesFromDB(text);
    await _getCurriencesFromAssets(text);
    await _getCurriencesFromPB(text);
    fetch();
  }

  void fetch() {
    _fetchDBCurrencies();
    _fetchAssetCurrencies();
    _fetchPBCurrencies();
    pageNumber++;
    isLoading = false;
    notifyListeners();
    print(pageNumber);
    print(pageNumber * pageSize);
    print(data.length);
  }

  void reset() {
    dbCurrencyIndex = 0;
    assetCurrencyIndex = 0;
    pbCurrencyIndex = 0;
    data = [];
    dBCurrencies = [];
    assetCurrencies = [];
    pbCurrencies = [];
    pageNumber = 1;
    dbCurrencyHasFinished = false;
    assetCurrencyHasFinished = false;
    pbCurrencyHasFinished = false;
  }

  void _fetchDBCurrencies() {
    if (dbCurrencyHasFinished) return;

    int endIndex = 0;

    if (pageNumber * pageSize > dBCurrencies.length) {
      endIndex = dBCurrencies.length - 1;
      dbCurrencyHasFinished = true;
    } else {
      endIndex = pageNumber * pageSize;
    }

    data.addAll(dBCurrencies.getRange(dbCurrencyIndex, endIndex));
    dbCurrencyIndex = endIndex;
  }

  void _fetchAssetCurrencies() {
    print('asset currency is called');
    if (assetCurrencyHasFinished) return;

    if (!dbCurrencyHasFinished) return;

    int endIndex = 0;

    if (pageNumber * pageSize > dBCurrencies.length + assetCurrencies.length) {
      assetCurrencyHasFinished = true;
    }

    if (pageNumber * pageSize > dBCurrencies.length + assetCurrencies.length) {
      endIndex = assetCurrencies.length;
      assetCurrencyHasFinished = true;
    } else {
      endIndex = (pageNumber * pageSize) - data.length;
    }

    data.addAll(assetCurrencies.getRange(assetCurrencyIndex, endIndex));
    assetCurrencyIndex = endIndex;
  }

  void _fetchPBCurrencies() {
    if (pbCurrencyHasFinished) return;

    if (!dbCurrencyHasFinished) return;
    if (!assetCurrencyHasFinished) return;
    int endIndex = 0;

    if (pageNumber * pageSize >
        dBCurrencies.length + assetCurrencies.length + pbCurrencies.length) {
      endIndex = pbCurrencies.length;
      pbCurrencyHasFinished = true;
    } else {
      endIndex = (pageNumber * pageSize) - data.length;
    }

    data.addAll(pbCurrencies.getRange(pbCurrencyIndex, endIndex));
    pbCurrencyIndex++;
  }

  Future<void> _getCurriencesFromDB(String text) async {
    final String json =
        await rootBundle.loadString(Paths.PRELOADED_CURRENCY_JSON);

    var data = jsonDecode(json) as List;
    //print(data);

    List<Group<BasicCurrency>> currencies = data.map((e) {
      return Group.fromObject(
        object: BasicCurrency.fromJson(e),
        groupName: 'db currency',
      );
    }).toList();

    List<Group<BasicCurrency>> result = [];

    for (var element in currencies) {
      if (element.object.code.toLowerCase().contains(text.toLowerCase()) ||
          element.object.name.toLowerCase().contains(text.toLowerCase())) {
        result.add(element);
      }
    }

    dBCurrencies = result;
  }

  Future<void> _getCurriencesFromAssets(String text) async {
    final String json =
        await rootBundle.loadString(Paths.PRELOADED_CURRENCY_JSON);

    var data = jsonDecode(json) as List;
    //print(data);

    List<Group<BasicCurrency>> currencies = data.map((e) {
      return Group.fromObject(
        object: BasicCurrency.fromJson(e),
        groupName: 'assets currency',
      );
    }).toList();

    List<Group<BasicCurrency>> result = [];

    for (var element in currencies) {
      if (element.object.code.toLowerCase().contains(text.toLowerCase()) ||
          element.object.name.toLowerCase().contains(text.toLowerCase())) {
        result.add(element);
      }
    }

    assetCurrencies = result;
  }

  Future<void> _getCurriencesFromPB(String text) async {
    final String json =
        await rootBundle.loadString(Paths.PRELOADED_CURRENCY_JSON);

    var data = jsonDecode(json) as List;
    //print(data);

    List<Group<BasicCurrency>> currencies = data.map((e) {
      return Group.fromObject(
        object: BasicCurrency.fromJson(e),
        groupName: 'pb currency',
      );
    }).toList();

    List<Group<BasicCurrency>> result = [];

    for (var element in currencies) {
      if (element.object.code.toLowerCase().contains(text.toLowerCase()) ||
          element.object.name.toLowerCase().contains(text.toLowerCase())) {
        result.add(element);
      }
    }

    pbCurrencies = result;
  }
}
