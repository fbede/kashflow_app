part of 'views.dart';

class CurrencyPickerView extends ConsumerStatefulWidget {
  const CurrencyPickerView({required this.titleString});
  final String titleString;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectCurrencyPickerViewState();
}

class _SelectCurrencyPickerViewState extends ConsumerState<CurrencyPickerView> {
  final _CurrencyPickerController _pickerController =
      _CurrencyPickerController();
  final ScrollController _scrollController = ScrollController();

  double numberOfColumns = 1;
  double aspectRatio = 10;

  @override
  void initState() {
    _pickerController.title = widget.titleString;
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
  void dispose() {
    _pickerController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmallCustomAppBar(
        title: Text(widget.titleString),
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GroupedScrollView.grid(
                  shrinkWrap: true,
                  scrollController: _scrollController,
                  gridDelegate: _getGridDelegate(context),
                  groupedOptions: _getGroupedScrollViewOptions(),
                  itemBuilder:
                      (BuildContext context, Group<BasicCurrency> item) {
                    return _ItemWidget(
                      item: item,
                      pickerController: _pickerController,
                    );
                  },
                  data: _pickerController.data,
                  headerBuilder: (BuildContext context) => SizedBox.shrink(),
                  footerBuilder: (BuildContext context) => SizedBox.shrink(),
                ),
              ),
            ),
          ),
          _BottomSearchBar(pickerController: _pickerController),
        ],
      ),
    );
  }

  SliverGridDelegateWithMaxCrossAxisExtent _getGridDelegate(
      BuildContext context) {
    return SliverGridDelegateWithMaxCrossAxisExtent(
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      maxCrossAxisExtent: 550,
      mainAxisExtent: 48,
    );
  }

  GroupedScrollViewOptions<Group<BasicCurrency>, String>
      _getGroupedScrollViewOptions() {
    return GroupedScrollViewOptions(
      itemGrouper: (Group<BasicCurrency> group) {
        return group.groupName;
      },
      stickyHeaderBuilder:
          (BuildContext context, String groupName, int groupedIndex) {
        return _StickyHeaderWidget(groupName: groupName);
      },
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    required this.item,
    required _CurrencyPickerController pickerController,
  }) : _pickerController = pickerController;

  final Group<BasicCurrency> item;
  final _CurrencyPickerController _pickerController;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
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
        onTap: () {
          Map<String, dynamic> extra = {
            NavParamKeys.BASIC_CURRENCY_EXTRA_KEY: item.object,
          };
          if (_pickerController.title == UserText.Choose_Default_Currency) {
            extra.addAll({NavParamKeys.IS_DEFAULT_EXTRA_KEY: true});
          }
          if (item.groupName == UserText.Saved_Curriences) {
            extra.addAll({NavParamKeys.IS_SAVED_EXTRA_KEY: true});
          }
          context.pushNamed(AppRoute.EDIT_CURRENCY, extra: extra);
        },
      ),
      // ),
    );
  }
}

class _StickyHeaderWidget extends StatelessWidget {
  const _StickyHeaderWidget({required this.groupName});

  final String groupName;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          '$groupName',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class _BottomSearchBar extends StatelessWidget {
  const _BottomSearchBar({
    required _CurrencyPickerController pickerController,
  }) : _pickerController = pickerController;

  final _CurrencyPickerController _pickerController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 12),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: _RoundedTextField(
                onChanged: (value) => _pickerController.search(text: value),
              ),
            ),
            SizedBox(width: 16),
            FloatingActionButton.small(
              elevation: 0,
              shape: CircleBorder(eccentricity: 1),
              child: Icon(Remix.add_fill),
              onPressed: () => _createNewCurrency(context),
            )
          ],
        ),
      ),
    );
  }

  void _createNewCurrency(BuildContext context) {
    Map<String, dynamic> extra = {};
    if (_pickerController.title == UserText.Choose_Default_Currency) {
      extra.addAll({NavParamKeys.IS_DEFAULT_EXTRA_KEY: true});
    }
    context.pushNamed(AppRoute.CREATE_NEW_CURRENCY, extra: extra);
  }
}

class _RoundedTextField extends StatelessWidget {
  const _RoundedTextField({
    required this.onChanged,
  });

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsetsDirectional.zero,
        prefixIcon: const Icon(Remix.search_line),
        hintText: UserText.Search_Currency_Name_or_Code,
        enabledBorder: _getInputBorder(context),
        focusedBorder: _getFocusedBorder(context),
      ),
    );
  }

  OutlineInputBorder _getInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: DecorationElements.getRegularBorderSide(context),
      borderRadius: BorderRadius.circular(30),
    );
  }

  OutlineInputBorder _getFocusedBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: DecorationElements.getFocusedBorderSide(context),
      borderRadius: BorderRadius.circular(30),
    );
  }
}

//TODO: Update to fetch from web & db
class _CurrencyPickerController extends ChangeNotifier {
  String title = '';

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
    _reset();
    await _getCurriencesFromDB(text);
    await _getCurriencesFromAssets(text);
    await _getCurriencesFromPB(text);
    fetch();
  }

  void fetch() {
    if (data.length >=
        dBCurrencies.length + assetCurrencies.length + pbCurrencies.length) {
      return;
    }
    _fetchDBCurrencies();
    _fetchAssetCurrencies();
    _fetchPBCurrencies();
    pageNumber++;
    isLoading = false;
    notifyListeners();
  }

  void _reset() {
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
      endIndex = dBCurrencies.length;
      dbCurrencyHasFinished = true;
    } else {
      endIndex = pageNumber * pageSize;
    }

    data.addAll(dBCurrencies.getRange(dbCurrencyIndex, endIndex));
    dbCurrencyIndex = endIndex;
  }

  void _fetchAssetCurrencies() {
    if (assetCurrencyHasFinished) return;

    if (!dbCurrencyHasFinished) return;

    int endIndex = 0;

    if (pageNumber * pageSize > dBCurrencies.length + assetCurrencies.length) {
      endIndex = assetCurrencies.length;
      assetCurrencyHasFinished = true;
    }
    if (assetCurrencyIndex + pageSize > assetCurrencies.length) {
      endIndex = assetCurrencies.length;
    } else {
      endIndex = assetCurrencyIndex + pageSize;
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
    }
    if (pbCurrencyIndex + pageSize > pbCurrencies.length) {
      endIndex = pbCurrencies.length;
    } else {
      endIndex = pbCurrencyIndex + pageSize;
    }

    data.addAll(pbCurrencies.getRange(pbCurrencyIndex, endIndex));
    pbCurrencyIndex = endIndex;
  }

  Future<void> _getCurriencesFromDB(String text) async {
    final String json =
        await rootBundle.loadString(Paths.PRELOADED_CURRENCY_JSON);

    final data = jsonDecode(json) as List;

    List<Group<BasicCurrency>> currencies = data.map((e) {
      return Group.fromObject(
        object: BasicCurrency.fromJson(e as Map<String, Object>),
        groupName: UserText.Saved_Curriences,
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

    List<Group<BasicCurrency>> currencies = data.map((e) {
      return Group.fromObject(
        object: BasicCurrency.fromJson(e as Map<String, Object?>),
        groupName: UserText.Popular_Curriences,
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

    List<Group<BasicCurrency>> currencies = data.map((e) {
      return Group.fromObject(
        object: BasicCurrency.fromJson(e as Map<String, Object?>),
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
