import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money2/money2.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../../app.dart';

class CreateAccountView extends ConsumerStatefulWidget {
  const CreateAccountView(
    this.defaultCurrencyData,
    this.defaultAccountIcon, {
    super.key,
  });

  final CurrencyTableData defaultCurrencyData;
  final AssetIconTableData defaultAccountIcon;

  @override
  ConsumerState<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends ConsumerState<CreateAccountView> {
  final _accountNameController = TextEditingController();
  final _amountController = TextEditingController(text: '0.0');
  final _currencyTextController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late final _iconSelectorController =
      IconSelectorController(widget.defaultAccountIcon);
  late final _currencyController =
      CurrencyFormFieldController(widget.defaultCurrencyData);

  bool _saveIsLoading = false;

  @override
  void initState() {
    super.initState();
    _currencyController.addListener(
      () => _currencyTextController.text = _currencyController.text,
    );
    _amountController.addListener(() {
      talker.log(Fixed.parse(_amountController.text));
    });
    _descriptionController.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _currencyTextController.text = _currencyController.text;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _accountNameController.dispose();
    _amountController.dispose();
    _currencyController.dispose();
    _currencyTextController.dispose();
    _descriptionController.dispose();
    _iconSelectorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userText = context.t.account_module;

    return Padding(
      padding: const EdgeInsetsDirectional.all(16),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                userText.add_account,
                style: context.textTheme.titleBold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              IconSelector(controller: _iconSelectorController),
              const SizedBox(height: 16),
              NameFormField(
                label: userText.account_name,
                controller: _accountNameController,
              ),
              const SizedBox(height: 8),
              CurrencyFormField(
                currencyController: _currencyController,
                textController: _currencyTextController,
              ),
              const SizedBox(height: 16),
              MoneyAmountFormField(controller: _amountController),
              const SizedBox(height: 16),
              DescriptionFormField(
                controller: _descriptionController,
                showSuffix: _descriptionController.text.isEmpty,
              ),
              const SizedBox(height: 8),
              SaveOrCancelButtonBar(
                onSave: _save,
                saveIsLoading: _saveIsLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      _saveIsLoading = true;
      setState(() {});

      final openingBalance = Fixed.copyWith(
        Fixed.parse(_amountController.text),
        scale: widget.defaultCurrencyData.decimalDigits,
      );

      final accountDto = CreateAccountDTO(
        accountName: _accountNameController.text,
        description: _descriptionController.text,
        amount: openingBalance,
        iconName: _iconSelectorController.iconData.name,
        backgroundColor: _iconSelectorController.backgroundColor,
        iconColor: _iconSelectorController.iconColor,
        currencyId: _currencyController.currency.id,
      );

      await ref.watch(accountsProvider.notifier).createNewAccount(accountDto);

      if (mounted) {
        context.pop();
      }
    } on Exception catch (e, s) {
      talker.handle(e, s);
    } finally {
      _saveIsLoading = false;
      setState(() {});
    }
  }
}
