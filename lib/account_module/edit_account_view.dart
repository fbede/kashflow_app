import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money2/money2.dart';

import '../shared/components/color_picker.dart';
import '../shared/components/custom_text_fields.dart';
import '../shared/components/dialog_shell.dart';
import '../shared/components/icon_picker/icon_picker.dart';
import '../shared/components/icon_picker/icon_selector.dart';
import '../shared/core/exception_handler.dart';
import '../shared/core/log_handler.dart';
import '../shared/core/responsive.dart';
import '../shared/elements/user_text.dart';
import 'account_models.dart';
import 'account_provider.dart';

class EditAccountView extends ConsumerStatefulWidget {
  const EditAccountView({required this.accountInfo, super.key});

  final AccountInfo accountInfo;

  @override
  ConsumerState<EditAccountView> createState() => _EditAccountViewState();
}

class _EditAccountViewState extends ConsumerState<EditAccountView> {
  final _accountNameController = TextEditingController();
  final _currencyNameController = TextEditingController();
  final _amountController = TextEditingController(text: '0.0');
  final _descriptionController = TextEditingController();
  late final IconSelectorController _iconSelectorController;

  final _formKey = GlobalKey<FormState>();
  late Currency _currency;
  bool _isLoading = false;

  @override
  void initState() {
    _accountNameController.text = widget.accountInfo.name;
    _currency = widget.accountInfo.openingBalance.currency;
    _currencyNameController.text = _currency.name;
    _amountController.text = widget.accountInfo.openingBalance.amount
        .toDecimal()
        .toDouble()
        .toString();

    _descriptionController
      ..text = widget.accountInfo.description
      ..addListener(() => setState(() {}));

    _iconSelectorController =
        IconSelectorController.fromIconData(widget.accountInfo.iconInfo);

    super.initState();
  }

  @override
  void dispose() {
    _accountNameController.dispose();
    _currencyNameController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    _iconSelectorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ResponsiveDialogShell(
        onSave: _save,
        onCancel: context.pop,
        isLoading: _isLoading,
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
                  UserText.editAnAccount,
                  style: context.textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                IconSelector(controller: _iconSelectorController),
                const SizedBox(height: 16),
                NameFormField(
                  label: UserText.accountName,
                  controller: _accountNameController,
                ),
                const SizedBox(height: 8),
                CurrencyFormField(controller: _currencyNameController),
                const SizedBox(height: 16),
                MoneyAmountFormField(controller: _amountController),
                const SizedBox(height: 16),
                DescriptionFormField(
                  controller: _descriptionController,
                  showSuffix: _descriptionController.text.isEmpty,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      );

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    _isLoading = true;
    setState(() {});

    final openingBalance = Money.fromNumWithCurrency(
      double.parse(_amountController.text),
      _currency,
    );

    final accountInfo = AccountInfo(
      id: widget.accountInfo.id,
      name: _accountNameController.text,
      description: _descriptionController.text,
      openingBalance: openingBalance,
      iconInfo: _iconSelectorController.iconInfo,
    );

    final router = GoRouter.of(context);

    try {
      await ref.read(accountsProvider.notifier).updateAccount(accountInfo);
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
