import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

import '../shared/responsive.dart';
import '../shared/user_text.dart';
import 'currency_picker_widget.dart';

Future<Currency> showCurrencyPicker({required BuildContext context}) async {
  Currency currency = CommonCurrencies().usd;

  await showDialog<Widget>(
    context: context,
    builder: (_) => CurrencyPickerDialog(onTap: (c) => currency = c),
  );

  return currency;
}

class CurrencyPickerDialog extends StatelessWidget {
  const CurrencyPickerDialog({required this.onTap, super.key});

  final void Function(Currency c) onTap;

  @override
  Widget build(BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(
                UserText.selectTheme,
                style: context.theme().textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              // const Divider(),
              Expanded(
                child: CurrencyPickerWidget(onTap: onTap),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
}
