import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money2/money2.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';

class CreateAccountView extends ConsumerStatefulWidget {
  const CreateAccountView(
    this.defaultCurrencyData,
    //   this.defaultAccountIcon,
    {
    super.key,
  });

  final CurrencyTableData defaultCurrencyData;
  // final AssetIconTableData defaultAccountIcon;

  @override
  ConsumerState<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends ConsumerState<CreateAccountView> {
  final _accountNameController = TextEditingController();
  final _amountController = TextEditingController(text: '0.0');
  final _currencyTextController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late final _iconSelectorController = IconSelectorController(Icons.abc);
  // late final AppCurrencyController _appCurrencyController;

  bool _saveIsLoading = false;

  @override
  void initState() {
    super.initState();
    // _appCurrencyController = AppCurrencyController(widget.defaultCurrencyData);
    // _appCurrencyController.addListener(
    //   () => _currencyTextController.text = _appCurrencyController.text,
    // );
    _descriptionController.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //     _currencyTextController.text = _appCurrencyController.text;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _accountNameController.dispose();
    _amountController.dispose();
    //  _appCurrencyController.dispose();
    _currencyTextController.dispose();
    _descriptionController.dispose();
    _iconSelectorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userText = context.t.account_module.create_account_view;

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text(
              userText.add_account,
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            IconSelector(controller: _iconSelectorController),
            const SizedBox(height: 16),
            NameFormField(
              label: userText.account_name,
              controller: _accountNameController,
            ),
            const SizedBox(height: 8),
            // CurrencyDropDown(),
            // CurrencyFormField(
            //   appCurrencyController: _appCurrencyController,
            //   textController: _currencyTextController,
            // ),
            const SizedBox(height: 16),
            MoneyAmountFormField(controller: _amountController),
            const SizedBox(height: 16),
            DescriptionFormField(
              controller: _descriptionController,
              showSuffix: _descriptionController.text.isEmpty,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: context.pop,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: context.colorScheme.error),
                      foregroundColor: context.colorScheme.error,
                    ),
                    child: Text(userText.cancel),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: _save,
                    child: _saveIsLoading
                        ? const CustomProgressIndicator()
                        : Text(userText.save),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _saveIsLoading = true;
    setState(() {});

    final openingBalance = Money.fromBigIntWithCurrency(
      BigInt.from(
        double.parse(_amountController.text),
      ),
      CommonCurrencies().aed,
      //  _appCurrencyController.currency,
    );

    // final accountInfo = Account.create(
    //   name: _accountNameController.text,
    //   description: _descriptionController.text,
    //   openingBalance: openingBalance,
    //   iconData: _iconSelectorController.iconData,
    //   backgroundColor: _iconSelectorController.backgroundColor,
    //   iconColor: _iconSelectorController.iconColor,
    //   currencyId: _appCurrencyController.currency.id,
    // );

    final router = GoRouter.of(context);

    try {
      //    await ref.watch(accountProvider.notifier).createNewAccount(accountInfo);
      router.pop();
    } on Exception catch (e, s) {
      talker.handle(e, s);
    } finally {
      _saveIsLoading = false;
      setState(() {});
    }
  }
}
