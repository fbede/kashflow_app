import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/account%20module/account_models.dart';
import 'package:kashflow/account%20module/account_provider.dart';
import 'package:kashflow/currency%20module/currency_picker_dialog.dart';
import 'package:kashflow/currency%20module/default_currency_provider.dart';
import 'package:kashflow/shared/components/calculator.dart';
import 'package:kashflow/shared/components/color_picker.dart';
import 'package:kashflow/shared/components/dialog_shell.dart';
import 'package:kashflow/shared/components/icon_picker.dart';
import 'package:kashflow/shared/components/other_widgets.dart';
import 'package:kashflow/shared/core/exception_handler.dart';
import 'package:kashflow/shared/core/log_handler.dart';
import 'package:kashflow/shared/core/responsive.dart';
import 'package:kashflow/shared/elements/user_text.dart';
import 'package:kashflow/shared/models/shared_models.dart';
import 'package:money2/money2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
  final _formKey = GlobalKey<FormState>();

  bool _loadedDefault = false;
  Color? _iconColor;
  Color? _backgroundColor;
  Currency? _currency;
  IconData _selectedIconData = PhosphorIcons.regular.coins;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _descriptionController.addListener(() => setState(() {}));
  }

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

    return ResponsiveDialogShell(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              Text(
                UserText.addAnAccount,
                style: context.theme().textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              _AvatarWidget(
                iconColor: _iconColor ??
                    context.theme().colorScheme.onPrimaryContainer,
                backgroundColor: _backgroundColor ??
                    context.theme().colorScheme.primaryContainer,
                selectedIconData: _selectedIconData,
                onBackgroundColorChanged: (color) {
                  _backgroundColor = color;
                  setState(() {});
                },
                onIconColorChanged: (color) {
                  _iconColor = color;
                  setState(() {});
                },
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
              ),
              const SizedBox(height: 8),
              _Footer(
                onSave: _save,
                onCancel: context.pop,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDefaultCurrency() {
    ref.watch(defaultCurrencyProvider).whenData((value) {
      if (_loadedDefault) return;

      _currency = value;

      _iconColor = context.theme().colorScheme.onPrimaryContainer;

      _backgroundColor = context.theme().colorScheme.primaryContainer;

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

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    _isLoading = true;
    setState(() {});

    final openingBalance = Money.fromNumWithCurrency(
      double.parse(_amountController.text),
      _currency!,
    );

    final iconInfo = IconInfo(
      iconData: _selectedIconData,
      iconColor: _iconColor!,
      backgroundColor: _backgroundColor!,
    );

    final accountInfo = AccountInfo(
      name: _accountNameController.text,
      description: _descriptionController.text,
      openingBalance: openingBalance,
      iconInfo: iconInfo,
    );

    final router = GoRouter.of(context);

    try {
      await ref.read(accountsProvider.notifier).createNewAccount(accountInfo);
      router.pop();
    } on Exception catch (e, s) {
      final handler = ExceptionHandler(
        context: context,
        exception: e,
        stacktrace: s,
      );
      if (handler.isSQLiteException) {
        await handler.handleSQLiteException();
      } else {
        Logger.instance.handle(e, s);
      }
    } finally {
      _isLoading = false;
      setState(() {});
    }
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    required this.onSave,
    required this.onCancel,
    required this.isLoading,
  });

  final void Function() onSave;
  final void Function() onCancel;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onCancel,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: context.theme().colorScheme.error),
                foregroundColor: context.theme().colorScheme.error,
              ),
              child: const Text(UserText.cancel),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: FilledButton(
              onPressed: onSave,
              child: isLoading
                  ? const CustomProgressIndicator()
                  : const Text(UserText.save),
            ),
          ),
        ],
      );
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    required this.onIconChanged,
    required this.selectedIconData,
    required this.onIconColorChanged,
    required this.onBackgroundColorChanged,
    required this.iconColor,
    required this.backgroundColor,
  });

  final ValueChanged<IconData> onIconChanged;
  final ValueChanged<Color> onIconColorChanged;
  final ValueChanged<Color> onBackgroundColorChanged;

  final IconData selectedIconData;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          SizedBox.square(
            dimension: 128,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(selectedIconData, size: 100, color: iconColor),
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
                  icon: Icon(selectedIconData, color: iconColor),
                ),
                TextButton.icon(
                  onPressed: () async => _onIconColorChanged(context),
                  icon: Padding(
                    padding: const EdgeInsets.all(4),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: iconColor,
                        shape: BoxShape.circle,
                      ),
                      child: const SizedBox.square(dimension: 16),
                    ),
                  ),
                  label: const Text('Change Icon Color'),
                ),
                TextButton.icon(
                  onPressed: () async => _onBackgroundColorChanged(context),
                  icon: Padding(
                    padding: const EdgeInsets.all(4),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: backgroundColor,
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

  Future<void> _onIconColorChanged(BuildContext context) async {
    final color = await showColorPicker(context, iconColor);
    onIconColorChanged(color);
  }

  Future<void> _onBackgroundColorChanged(BuildContext context) async {
    final color = await showColorPicker(context, backgroundColor);
    onBackgroundColorChanged(color);
  }
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
        keyboardType: TextInputType.multiline,
        textCapitalization: TextCapitalization.sentences,
        minLines: 1,
        maxLines: 5,
        maxLength: 100,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(PhosphorIcons.regular.textAlignLeft),
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
        textCapitalization: TextCapitalization.words,
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
    if (input.length < 3) {
      return 'Too short';
    }

    return null;
  }
}
