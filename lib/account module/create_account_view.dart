import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money2/money2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../currency module/currency_picker_dialog.dart';
import '../currency module/default_currency_provider.dart';
import '../shared/calculator.dart';
import '../shared/icon_picker.dart';
import '../shared/responsive.dart';
import '../shared/user_text.dart';

class CreateAccountView extends ConsumerStatefulWidget {
  const CreateAccountView({super.key});

  @override
  ConsumerState<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends ConsumerState<CreateAccountView> {
  final _accountNameController = TextEditingController();
  final _currencyNameController = TextEditingController();
  final _amountController = TextEditingController(text: '0.0');
  final _descriptionController = TextEditingController();

  static const _defaultIconData = RemixIcon.coins_line;

  Currency? _currency;
  bool _loadedDefault = false;
  IconData _selectedIconData = _defaultIconData;

  @override
  void initState() {
    super.initState();
    _descriptionController.addListener(() => setState(() {}));
  }

  @override
  @override
  void dispose() {
    _accountNameController.dispose();
    _currencyNameController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    showDefaultCurrency();

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          const _Header(),
          const SizedBox(height: 16),
          _AvatarWidget(
            selectedIconData: _selectedIconData,
            onIconChanged: (i) {
              _selectedIconData = i;
              setState(() {});
            },
          ),
          const SizedBox(height: 16),
          _AccountNameWidget(controller: _accountNameController),
          const SizedBox(height: 8),
          _CurrencyFieldWidget(controller: _currencyNameController),
          const SizedBox(height: 16),
          _AmountFieldWidget(controller: _amountController),
          const SizedBox(height: 16),
          _DescriptionWidget(
            controller: _descriptionController,
            showSuffix: _descriptionController.text.isEmpty,
          )
        ],
      ),
    );
  }

  void showDefaultCurrency() {
    ref.watch(defaultCurrencyProvider).whenData((value) {
      if (_loadedDefault) return;
      {}
      _currency = value;
      _loadedDefault = true;
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _updateCurrencyController(_currency));
    });
  }

  void _updateCurrencyController(Currency? c) {
    _currency = c;
    late String text;

    if (c == null) {
      text = '';
    } else {
      text = '${_currency?.name ?? ''} (${_currency?.code ?? ''})';
    }

    _currencyNameController.text = text.trim();
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    required this.onIconChanged,
    required this.selectedIconData,
  });

  final ValueChanged<IconData> onIconChanged;

  final IconData selectedIconData;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          SizedBox.square(
            dimension: 128,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.theme().colorScheme.primaryContainer,
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                selectedIconData,
                size: 100,
                color: context.theme().colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton.icon(
                  label: const Text('Change Icon'),
                  onPressed: () async {
                    final icon = await showIconPicker(context);
                    if (icon != null) {
                      onIconChanged(icon);
                    }
                  },
                  icon: Icon(selectedIconData),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Padding(
                    padding: const EdgeInsets.all(4),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.theme().colorScheme.onPrimaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: const SizedBox.square(dimension: 16),
                    ),
                  ),
                  label: const Text('Change Icon Color'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Padding(
                    padding: const EdgeInsets.all(4),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.theme().colorScheme.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: const SizedBox.square(dimension: 16),
                    ),
                  ),
                  label: const Text('Change Background Color'),
                )
              ],
            ),
          )
        ],
      );
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    required this.controller,
    required this.showSuffix,
  });

  final TextEditingController controller;
  final bool showSuffix;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        keyboardType: TextInputType.name,
        minLines: 1,
        maxLines: 4,
        maxLength: 100,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(PhosphorIcons.regular.pencilSimpleLine),
          labelText: UserText.description,
          suffixIcon: showSuffix
              ? null
              : IconButton(
                  onPressed: controller.clear,
                  icon: Icon(PhosphorIcons.fill.xCircle),
                ),
        ),
      );
}

class _AmountFieldWidget extends StatelessWidget {
  const _AmountFieldWidget({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(
          signed: true,
          decimal: true,
        ),
        inputFormatters: amountFieldFormatters,
        textAlign: TextAlign.end,
        decoration: InputDecoration(
          isDense: true,
          labelText: UserText.amount,
          prefixIcon: Icon(PhosphorIcons.regular.coins),
          suffixIcon: IconButton(
            icon: Icon(PhosphorIcons.regular.calculator),
            onPressed: () async => _onAmountTap(context),
          ),
        ),
      );

  Future<void> _onAmountTap(BuildContext context) async {
    final result = await showCalculator(context);
    controller.text = result.toString();
  }
}

class _CurrencyFieldWidget extends StatelessWidget {
  const _CurrencyFieldWidget({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        showCursor: false,
        onTap: () async => _onCurrencyTap(context),
        decoration: InputDecoration(
          isDense: true,
          labelText: UserText.currency,
          prefixIcon: Icon(PhosphorIcons.regular.money),
        ),
        validator: _validator,
      );

  String? _validator(String? v) {
    if (v == null || v.isEmpty) {
      return 'Cannot be empty';
    }
    return null;
  }

  Future<void> _onCurrencyTap(BuildContext context) async {
    final result = await showCurrencyPicker(context);
    late String text;

    if (result == null) {
      text = '';
    } else {
      text = '${result.name} (${result.code})';
    }

    controller.text = text.trim();
  }
}

class _AccountNameWidget extends StatelessWidget {
  const _AccountNameWidget({required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        keyboardType: TextInputType.name,
        maxLength: 25,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(PhosphorIcons.regular.pencilSimpleLine),
          labelText: UserText.accountName,
        ),
        validator: _validator,
      );

  String? _validator(String? input) {
    if (input == null || input.isEmpty) {
      return 'Cannot be empty';
    }
    return null;
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Visibility(
            visible: context.isPhone(),
            child: IconButton(
              icon: Icon(PhosphorIcons.regular.x),
              iconSize: 24,
              onPressed: () => context.pop(),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Add an Account',
              style: context.theme().textTheme.titleLarge,
            ),
          ),
          Visibility(
            visible: !context.isPhone(),
            child: IconButton(
              icon: Icon(PhosphorIcons.regular.check),
              iconSize: 24,
              onPressed: () {},
            ),
          ),
          Visibility(
            visible: !context.isPhone(),
            child: IconButton(
              icon: Icon(PhosphorIcons.regular.x),
              iconSize: 24,
              onPressed: () {},
            ),
          ),
        ],
      );
}
