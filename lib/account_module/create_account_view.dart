import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money2/money2.dart';

import '../currency_module/default_currency_provider.dart';
import '../shared/components/custom_text_fields.dart';
import '../shared/components/dialog_shell.dart';
import '../shared/components/icon_picker/icon_selector.dart';
import '../shared/core/exception_handler.dart';
import '../shared/core/log_handler.dart';
import '../shared/core/responsive.dart';
import '../shared/elements/user_text.dart';
import 'account_models.dart';
import 'account_provider.dart';

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
  late final IconSelectorController _iconSelectorController;
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _loadedDefault = false;
  Currency? _currency;

  @override
  void initState() {
    _iconSelectorController = IconSelectorController(
      iconColor: context.colorScheme.onPrimaryContainer,
      backgroundColor: context.colorScheme.primaryContainer,
    );
    super.initState();
    _descriptionController.addListener(() => setState(() {}));
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
  Widget build(BuildContext context) {
    showDefaultCurrency();

    return ResponsiveDialogShell(
      onSave: _save,
      onCancel: context.pop,
      isLoading: _isLoading,
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              UserText.addAnAccount,
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
    );
  }

  void showDefaultCurrency() {
    ref.watch(defaultCurrencyProvider).whenData((value) {
      if (_loadedDefault) return;

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

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    _isLoading = true;
    setState(() {});

    final openingBalance = Money.fromNumWithCurrency(
      double.parse(_amountController.text),
      _currency!,
    );

    final accountInfo = AccountInfo(
      name: _accountNameController.text,
      description: _descriptionController.text,
      openingBalance: openingBalance,
      iconInfo: _iconSelectorController.iconInfo,
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
