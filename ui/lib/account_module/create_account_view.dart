import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow_core/kashflow_core.dart';

import '../components/custom_controllers.dart';
import '../components/custom_text_fields.dart';
import '../components/dialog_shell.dart';
import '../components/icon_picker/icon_selector.dart';
import '../components/other_widgets.dart';
import '../core/exception_handler.dart';
import '../core/responsive.dart';

import '../currency_module/currency_provider.dart';
import '../ui_elements/user_text.dart';
import 'account_provider.dart';

class CreateAccountView extends ConsumerStatefulWidget {
  const CreateAccountView({super.key});

  @override
  ConsumerState<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends ConsumerState<CreateAccountView> {
  final _accountNameController = TextEditingController();
  final _amountController = TextEditingController(text: '0.0');
  final _descriptionController = TextEditingController();

  late final CurrencyFieldController _currencyNameController;
  late final IconSelectorController _iconSelectorController;
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _loadedDefault = false;
  CurrencyTableData? _currencyData;

  @override
  void initState() {
    _descriptionController.addListener(() => setState(() {}));
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
  Widget build(BuildContext context) => ref.watch(defaultCurrencyProvider).when(
        error: (_, __) => CustomProgressIndicator(),
        loading: () => CustomProgressIndicator(),
        data: (data) {
          _currencyData = data;
          _currencyNameController = CurrencyFieldController(data);
          _iconSelectorController = IconSelectorController(
            iconColor: context.colorScheme.onPrimaryContainer,
            backgroundColor: context.colorScheme.primaryContainer,
          );

          return ResponsiveDialogShell(
            onSave: _save,
            onCancel: context.pop,
            saveIsLoading: _isLoading,
            cancelIsLoading: false,
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
        },
      );

  void _showDefaultCurrency() {
    ref.watch(defaultCurrencyProvider).whenData((value) {
      if (_loadedDefault) return;

      _currencyData = value;
      _loadedDefault = true;

      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _currencyNameController.currencyData = _currencyData!,
      );
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    _isLoading = true;
    setState(() {});

    final openingBalance = BigInt.from(
      double.parse(_amountController.text),
    );

    final accountInfo = AccountInfo(
      id: null,
      name: _accountNameController.text,
      description: _descriptionController.text,
      currencyData: _currencyData!,
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
        logger.handle(e, s);
      }
    } finally {
      _isLoading = false;
      setState(() {});
    }
  }
}
