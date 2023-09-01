import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow_core/kashflow_core.dart';

import '../components/custom_controllers.dart';
import '../components/custom_text_fields.dart';
import '../components/dialog_shell.dart';
import '../components/icon_picker/icon_selector.dart';
import '../core/exception_handler.dart';
import '../core/responsive.dart';
import '../ui_elements/user_text.dart';
import 'account_provider.dart';

class OldAccountView extends ConsumerStatefulWidget {
  const OldAccountView({required this.accountInfo, super.key});

  final AccountInfo accountInfo;

  @override
  ConsumerState<OldAccountView> createState() => _AccountViewState();
}

class _AccountViewState extends ConsumerState<OldAccountView> {
  final _accountNameController = TextEditingController();
  final _amountController = TextEditingController(text: '0.0');
  final _descriptionController = TextEditingController();

  late final CurrencyFieldController _currencyNameController;
  late final IconSelectorController _iconSelectorController;

  final _formKey = GlobalKey<FormState>();
  late CurrencyTableData _currencyInfo;
  bool _isLoading = false;

  @override
  void initState() {
    _accountNameController.text = widget.accountInfo.name;
    _currencyInfo = widget.accountInfo.currencyInfo;
    _currencyNameController =
        CurrencyFieldController(widget.accountInfo.currencyInfo);
    _amountController.text =
        widget.accountInfo.openingBalance.toDouble().toString();

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
        saveIsLoading: _isLoading,
        cancelIsLoading: false,
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

    final openingBalance = BigInt.from(double.parse(_amountController.text));

    final accountInfo = AccountInfo(
      id: widget.accountInfo.id,
      name: _accountNameController.text,
      description: _descriptionController.text,
      openingBalance: openingBalance,
      iconInfo: _iconSelectorController.iconInfo,
      currencyData: _currencyInfo,
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
        logger.handle(e, s);
      }
    } finally {
      _isLoading = false;
      setState(() {});
    }
  }
}
