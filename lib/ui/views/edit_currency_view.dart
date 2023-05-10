// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'views.dart';

class EditCurrencyView extends ConsumerStatefulWidget {
  EditCurrencyView({
    super.key,
    required this.titleString,
    Object? extra,
  }) {
    if (extra == null) return;
    extra = extra as Map<String, dynamic>;
    currency = extra[NavParamKeys.BASIC_CURRENCY_EXTRA_KEY] as BasicCurrency?;
    isSaved = extra[NavParamKeys.IS_SAVED_EXTRA_KEY] as bool? ?? false;
    isDefault = extra[NavParamKeys.IS_DEFAULT_EXTRA_KEY] as bool? ?? false;
  }

  final String titleString;
  late final BasicCurrency? currency;
  late final bool isDefault;
  late final bool isSaved;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditCurrencyViewState();
}

class _EditCurrencyViewState extends ConsumerState<EditCurrencyView> {
  final _currencyDao = CurrencyDao(GetIt.I<DriftDB>());
  final _prefs = GetIt.I<SharedPreferences>();

  final _formKey = GlobalKey<FormState>();
  final currencyCodeController = TextEditingController();
  final currencySymbolController = TextEditingController();
  final currencyNameController = TextEditingController();
  final currencyUnitController = TextEditingController();
  final currencyCountryController = TextEditingController();

  bool invertSeparators = false;
  bool isCrypto = false;
  bool useCurrencyCode = false;
  bool currencyOnRightSide = false;
  bool addSpaceBetweenCurrencyAndAmount = true;
  bool showTrailingZeros = false;

  bool isLoading = false;

  String currencyPattern = 'S0.00';
  String currencyCodeHint = '';
  String currencySymbolHint = '';
  String currencyNameHint = '';
  String currencyUnitHint = '';

  @override
  void initState() {
    initControllers();
    _updatePattern();
    super.initState();
  }

  //TODO: Localize to currency
  void initControllers() {
    currencyCodeController.text = widget.currency?.code ?? '';
    currencyCodeHint = widget.currency?.code ?? 'USD';
    currencySymbolController.text = widget.currency?.symbol ?? '';
    currencySymbolHint = widget.currency?.symbol ?? r'$';
    currencyNameController.text = widget.currency?.name ?? '';
    currencyNameHint = widget.currency?.name ?? 'US Dollar';

    final unit = widget.currency?.name.split(' ') ?? [];

    if (unit.length == 1) {
      currencyUnitController.text = unit[0];
      currencyUnitHint = unit[0];
    }

    if (unit.length > 1) {
      currencyUnitController.text = unit.last;
      currencyUnitHint = unit.last;
    }
  }

  @override
  dispose() {
    currencyCodeController.dispose();
    currencyCountryController.dispose();
    currencyNameController.dispose();
    currencySymbolController.dispose();
    currencyUnitController.dispose();
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
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Display Style'),
                  SizedBox(height: 16),
                  Text(
                    _getCurrencyStyle(),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Amount: ${_getDisplayString()}'),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomScrollView(
                  slivers: [
                    SliverGrid.builder(
                      itemCount: 11,
                      gridDelegate: _getGridDelegate(context),
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return _buildCurrencyCode();
                          case 1:
                            return _buildCurrencySymbol();
                          case 2:
                            return _buildCurrencyName();
                          case 3:
                            return _buildCurrencyUnit();
                          case 4:
                            return _buildCurrencyCountry();
                          case 5:
                            return _buildInvertSeparators();
                          case 6:
                            return _buildIsCryptoCurrency();
                          case 7:
                            return _buildUseCurrencyCode();
                          case 8:
                            return _buildCurrencyOnRightSide();
                          case 9:
                            return _buildAddSpace();
                          case 10:
                            return _buildShowZeros();
                          default:
                            return SizedBox.shrink();
                        }
                      },
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 8),
                    ),
                    SliverToBoxAdapter(
                      child: isLoading
                          ? CustomProgressIndicator()
                          : FilledButton(
                              onPressed: () => _complete(),
                              child: Text('Complete'),
                            ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 8),
                    ),
                    _buildDeleteButton(),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildDeleteButton() {
    if (widget.isSaved) {
      return SliverToBoxAdapter(
        child: Row(
          children: [
            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              onPressed: () {},
              child: Text(
                UserText.Delete,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      );
    }
    return SliverToBoxAdapter(
      child: isLoading
          ? CustomProgressIndicator()
          : FilledButton(
              onPressed: () => _complete(),
              child: Text('Complete'),
            ),
    );
  }

  SliverGridDelegateWithMaxCrossAxisExtent _getGridDelegate(
      BuildContext context) {
    return SliverGridDelegateWithMaxCrossAxisExtent(
      mainAxisSpacing: 4,
      crossAxisSpacing: 16,
      maxCrossAxisExtent: 550,
      mainAxisExtent: 56,
    );
  }

  void _complete() async {
    final isValid = _formKey.currentState!.validate();

    late Currency currency;

    if (isValid) {
      currency = _createCurrency();
      isLoading = true;
      setState(() {});
      try {
        await Future.delayed(Duration(minutes: 1));
        await _currencyDao
            .saveCurrency(currency: currency, isDefault: widget.isDefault)
            .then((value) {
          _prefs.setBool(SharedPrefKeys.ONBOARDED, true);
          context.goNamed(AppRoute.DASHBOARD_ROUTE);
        });
      } catch (e) {
        if (context.isPhone()) {
          context.showErrorSnackBar(e.toString());
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Icon(
                  Remix.error_warning_line,
                  color: Theme.of(context).colorScheme.error,
                ),
                content: Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              );
            },
          );
        }
      } finally {
        isLoading = false;
        setState(() {});
      }
    }
  }

  int _getDisplayString() {
    if (isCrypto) {
      return 1234567000000000000;
    }
    return 12345670000;
  }

  int _getScale() {
    if (isCrypto) {
      return 19;
    }
    return 4;
  }

  SwitchListTile _buildShowZeros() {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text('Always show trailing zeros'),
      value: showTrailingZeros,
      onChanged: (value) {
        showTrailingZeros = value;
        _updatePattern();
        setState(() {});
      },
    );
  }

  SwitchListTile _buildAddSpace() {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text('Add Space Between Currency and Amount'),
      value: addSpaceBetweenCurrencyAndAmount,
      onChanged: (value) {
        addSpaceBetweenCurrencyAndAmount = value;
        _updatePattern();
        setState(() {});
      },
    );
  }

  SwitchListTile _buildCurrencyOnRightSide() {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text('Display Currency on Right Side'),
      value: currencyOnRightSide,
      onChanged: (value) {
        currencyOnRightSide = value;
        _updatePattern();
        setState(() {});
      },
    );
  }

  SwitchListTile _buildUseCurrencyCode() {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text('Use Currency Code'),
      value: useCurrencyCode,
      onChanged: (value) {
        useCurrencyCode = value;
        _updatePattern();
        setState(() {});
      },
    );
  }

  SwitchListTile _buildIsCryptoCurrency() {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text('Is Cyrptocurrency'),
      value: isCrypto,
      onChanged: (value) {
        isCrypto = value;
        _updatePattern();
        setState(() {});
      },
    );
  }

  SwitchListTile _buildInvertSeparators() {
    return SwitchListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text('Invert Separators'),
      value: invertSeparators,
      onChanged: (value) {
        invertSeparators = value;
        _updatePattern();
        setState(() {});
      },
    );
  }

  Row _buildCurrencyCountry() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Currency Country'),
        SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: currencyCountryController,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              enabledBorder: _getInputBorder(context),
              focusedBorder: _getFocusedBorder(context),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildCurrencyUnit() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Currency Unit'),
        SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: currencyUnitController,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              hintText: currencyUnitHint,
              enabledBorder: _getInputBorder(context),
              focusedBorder: _getFocusedBorder(context),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildCurrencyName() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Currency Name'),
        SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: currencyNameController,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              hintText: currencyNameHint,
              enabledBorder: _getInputBorder(context),
              focusedBorder: _getFocusedBorder(context),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildCurrencySymbol() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Currency Symbol*'),
        SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: currencySymbolController,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              hintText: currencySymbolHint,
              enabledBorder: _getInputBorder(context),
              focusedBorder: _getFocusedBorder(context),
            ),
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'Must not be empty';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Row _buildCurrencyCode() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Currency Code*'),
        SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            maxLines: 1,
            controller: currencyCodeController,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              hintText: currencyCodeHint,
              enabledBorder: _getInputBorder(context),
              focusedBorder: _getFocusedBorder(context),
            ),
            validator: (v) {
              if (v == null || v.length < 3) {
                return 'Must be at least 3 letters';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  UnderlineInputBorder _getInputBorder(BuildContext context) {
    return UnderlineInputBorder(
      borderSide: DecorationElements.getRegularBorderSide(context),
    );
  }

  UnderlineInputBorder _getFocusedBorder(BuildContext context) {
    return UnderlineInputBorder(
      borderSide: DecorationElements.getFocusedBorderSide(context),
    );
  }

  String _getCurrencyStyle() {
    if (currencyCodeController.text.isEmpty) {
      return _getDisplayString().toString();
    }

    final currency = _createCurrency();

    final money = Money.fromFixedWithCurrency(
        Fixed.fromInt(_getDisplayString(), scale: _getScale()), currency);

    return money.toString();
  }

  Currency _createCurrency() {
    return Currency.create(
      currencyCodeController.text.toUpperCase(),
      _getScale(),
      symbol: currencySymbolController.text,
      pattern: currencyPattern,
      invertSeparators: invertSeparators,
      country: currencyCountryController.text,
      unit: currencyUnitController.text,
      name: currencyNameController.text,
    );
  }

  void _updatePattern() {
    const symbol = 'S';
    const code = 'CCC';
    const space = ' ';
    const hash = '#';
    const zero = '0';
    const emptyString = '';

    String pattern = '';
    String prefix = '';
    String trailingSymbol = '';

    String addSpace() {
      if (addSpaceBetweenCurrencyAndAmount) {
        return space;
      } else {
        return emptyString;
      }
    }

    if (invertSeparators) {
      for (var i = 0; i < 6; i++) {
        pattern = pattern + hash + hash + hash + '.';
      }
      pattern = pattern + hash + hash + hash + ',';
    } else {
      for (var i = 0; i < 6; i++) {
        pattern = pattern + hash + hash + hash + ',';
      }
      pattern = pattern + hash + hash + hash + '.';
    }

    if (showTrailingZeros) {
      trailingSymbol = zero;
    } else {
      trailingSymbol = hash;
    }

    if (useCurrencyCode) {
      prefix = code;
    } else {
      prefix = symbol;
    }

    if (isCrypto) {
      for (var i = 0; i < 9; i++) {
        pattern = pattern + trailingSymbol;
      }
    } else {
      pattern = pattern + trailingSymbol + trailingSymbol;
    }

    if (currencyOnRightSide) {
      pattern = pattern + addSpace() + prefix;
    } else {
      pattern = prefix + addSpace() + pattern;
    }

    currencyPattern = pattern;
  }
}
