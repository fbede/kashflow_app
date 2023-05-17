import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:money2/money2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../elements/elements.dart';
import '../shared/responsive.dart';
import '../shared/route_names.dart';
import '../shared/user_text.dart';
import '../util/old_hidden_strings.dart';
import 'db/currency_dao.dart';
import 'db/drift_db.dart';
import 'models/util_models.dart';

class EditCurrencyView extends ConsumerStatefulWidget {
  EditCurrencyView({
    required this.titleString,
    super.key,
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
  void dispose() {
    currencyCodeController.dispose();
    currencyCountryController.dispose();
    currencyNameController.dispose();
    currencySymbolController.dispose();
    currencyUnitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                    const Text('Display Style'),
                    const SizedBox(height: 16),
                    Text(
                      _getCurrencyStyle(),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Amount: ${_getDisplayString()}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
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
                              return const SizedBox.shrink();
                          }
                        },
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 8),
                      ),
                      SliverToBoxAdapter(
                        child: isLoading
                            ? const CustomProgressIndicator()
                            : FilledButton(
                                onPressed: _complete,
                                child: const Text('Complete'),
                              ),
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 8),
                      ),
                      _buildDeleteButton(),
                      const SliverToBoxAdapter(
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

  SliverToBoxAdapter _buildDeleteButton() {
    if (widget.isSaved) {
      return SliverToBoxAdapter(
        child: Row(
          children: [
            const Spacer(),
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
            const Spacer(),
          ],
        ),
      );
    }
    return SliverToBoxAdapter(
      child: isLoading
          ? const CustomProgressIndicator()
          : FilledButton(
              onPressed: _complete,
              child: const Text('Complete'),
            ),
    );
  }

  SliverGridDelegateWithMaxCrossAxisExtent _getGridDelegate(
    BuildContext context,
  ) =>
      const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 4,
        crossAxisSpacing: 16,
        maxCrossAxisExtent: 550,
        mainAxisExtent: 56,
      );

  Future<void> _complete() async {
    final isValid = _formKey.currentState!.validate();

    late Currency currency;

    if (isValid) {
      currency = _createCurrency();
      isLoading = true;
      setState(() {});
      try {
        await Future.delayed(const Duration(minutes: 1), () {});
        await _currencyDao
            .saveCurrency(currency: currency, isDefault: widget.isDefault)
            .then((value) {
          _prefs.setBool(SharedPrefKeys.ONBOARDED, true);
          context.goNamed(Routes.dashboard);
        });
      } on Exception catch (e) {
        if (context.isPhone()) {
          context.showErrorSnackBar(e.toString());
        } else {
          await showDialog<Widget>(
            context: context,
            builder: (context) => AlertDialog(
              title: Icon(
                PhosphorIcons.regular.warningCircle,
                color: Theme.of(context).colorScheme.error,
              ),
              content: Text(
                e.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
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

  SwitchListTile _buildShowZeros() => SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text('Always show trailing zeros'),
        value: showTrailingZeros,
        onChanged: (value) {
          showTrailingZeros = value;
          _updatePattern();
          setState(() {});
        },
      );

  SwitchListTile _buildAddSpace() => SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text('Add Space Between Currency and Amount'),
        value: addSpaceBetweenCurrencyAndAmount,
        onChanged: (value) {
          addSpaceBetweenCurrencyAndAmount = value;
          _updatePattern();
          setState(() {});
        },
      );

  SwitchListTile _buildCurrencyOnRightSide() => SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text('Display Currency on Right Side'),
        value: currencyOnRightSide,
        onChanged: (value) {
          currencyOnRightSide = value;
          _updatePattern();
          setState(() {});
        },
      );

  SwitchListTile _buildUseCurrencyCode() => SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text('Use Currency Code'),
        value: useCurrencyCode,
        onChanged: (value) {
          useCurrencyCode = value;
          _updatePattern();
          setState(() {});
        },
      );

  SwitchListTile _buildIsCryptoCurrency() => SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text('Is Cyrptocurrency'),
        value: isCrypto,
        onChanged: (value) {
          isCrypto = value;
          _updatePattern();
          setState(() {});
        },
      );

  SwitchListTile _buildInvertSeparators() => SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text('Invert Separators'),
        value: invertSeparators,
        onChanged: (value) {
          invertSeparators = value;
          _updatePattern();
          setState(() {});
        },
      );

  Row _buildCurrencyCountry() => Row(
        children: [
          const Text('Currency Country'),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: currencyCountryController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                enabledBorder: _getInputBorder(context),
                focusedBorder: _getFocusedBorder(context),
              ),
            ),
          ),
        ],
      );

  Row _buildCurrencyUnit() => Row(
        children: [
          const Text('Currency Unit'),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: currencyUnitController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                hintText: currencyUnitHint,
                enabledBorder: _getInputBorder(context),
                focusedBorder: _getFocusedBorder(context),
              ),
            ),
          ),
        ],
      );

  Row _buildCurrencyName() => Row(
        children: [
          const Text('Currency Name'),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: currencyNameController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                hintText: currencyNameHint,
                enabledBorder: _getInputBorder(context),
                focusedBorder: _getFocusedBorder(context),
              ),
            ),
          ),
        ],
      );

  Row _buildCurrencySymbol() => Row(
        children: [
          const Text('Currency Symbol*'),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: currencySymbolController,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
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

  Row _buildCurrencyCode() => Row(
        children: [
          const Text('Currency Code*'),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: currencyCodeController,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
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

  UnderlineInputBorder _getInputBorder(BuildContext context) =>
      UnderlineInputBorder(
        borderSide: DecorationElements.getRegularBorderSide(context),
      );

  UnderlineInputBorder _getFocusedBorder(BuildContext context) =>
      UnderlineInputBorder(
        borderSide: DecorationElements.getFocusedBorderSide(context),
      );

  String _getCurrencyStyle() {
    if (currencyCodeController.text.isEmpty) {
      return _getDisplayString().toString();
    }

    final currency = _createCurrency();

    final money = Money.fromFixedWithCurrency(
      Fixed.fromInt(_getDisplayString(), scale: _getScale()),
      currency,
    );

    return money.toString();
  }

  Currency _createCurrency() => Currency.create(
        currencyCodeController.text.toUpperCase(),
        _getScale(),
        symbol: currencySymbolController.text,
        pattern: currencyPattern,
        invertSeparators: invertSeparators,
        country: currencyCountryController.text,
        unit: currencyUnitController.text,
        name: currencyNameController.text,
      );

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
        pattern = '$pattern$hash$hash$hash.';
      }
      pattern = '$pattern$hash$hash$hash,';
    } else {
      for (var i = 0; i < 6; i++) {
        pattern = '$pattern$hash$hash$hash,';
      }
      pattern = '$pattern$hash$hash$hash.';
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
