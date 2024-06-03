import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money2/money2.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../../app.dart';

class EditAccountView extends ConsumerStatefulWidget {
  const EditAccountView(
    this.data, {
    super.key,
  });

  final Account data;

  @override
  ConsumerState<EditAccountView> createState() => _EditAccountViewState();
}

class _EditAccountViewState extends ConsumerState<EditAccountView> {
  final _formKey = GlobalKey<FormState>();
  final _currencyTextController = TextEditingController();
  late final _accountNameController =
      TextEditingController(text: widget.data.name);
  late final _amountController =
      TextEditingController(text: widget.data.openingBalance.amount.toString());
  late final _descriptionController =
      TextEditingController(text: widget.data.description);
  late final _currencyController =
      CurrencyFormFieldController(widget.data.currencyData);

  late final _iconSelectorController = IconSelectorController(
    widget.data.iconData,
    iconColor: widget.data.iconColor,
    backgroundColor: widget.data.backgroundColor,
  );

  bool _saveIsLoading = false;

  @override
  void initState() {
    super.initState();
    _currencyController.addListener(
      () => _currencyTextController.text = _currencyController.text,
    );
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
    final userText = context.t.account_module.create_edit_account_view;

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
                userText.edit_account,
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

      final openingBalance = BigInt.from(double.parse(_amountController.text));

      final accountDto = EditAccountDTO(
        id: widget.data.id,
        accountName: _accountNameController.text,
        description: _descriptionController.text,
        amount: openingBalance,
        iconName: _iconSelectorController.iconData.name,
        backgroundColor: _iconSelectorController.backgroundColor,
        iconColor: _iconSelectorController.iconColor,
        currencyId: _currencyController.currency.id,
      );

      //   await ref.watch(accountsProvider.notifier).createNewAccount(accountDto);

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

  Future<void> _warnUserOnDangerousChanges() async {
    final warnings = <String>[];
    if (widget.data.currencyData != _currencyController.currency) {
      //add currency warning
    }

    if (widget.data.openingBalance.amount.toString() !=
        _amountController.text) {
      // add amount warning
    }
  }
}
