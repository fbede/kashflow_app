import 'package:flutter/material.dart';
import 'package:money2/money2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../shared/responsive.dart';
import '../shared/user_text.dart';
import 'currency_picker_body.dart';

Future<Currency> showCurrencyPicker({required BuildContext context}) async {
  Currency currency = CommonCurrencies().usd;

  await showDialog<Widget>(
    context: context,
    builder: (_) => CurrencyPickerDialog(onTap: (c) => print(c)),
  );

  return currency;
}

class CurrencyPickerDialog extends StatefulWidget {
  const CurrencyPickerDialog({required this.onTap, super.key});

  final ValueChanged<Currency> onTap;

  @override
  State<CurrencyPickerDialog> createState() => _CurrencyPickerDialogState();
}

class _CurrencyPickerDialogState extends State<CurrencyPickerDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                UserText.selectTheme,
                style: context.theme().textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              const Divider(height: 1),
              Expanded(
                child: CurrencyPickerBody(
                  onTap: widget.onTap,
                  textController: _controller,
                ),
              ),
              const Divider(height: 1),
              _BottomSearchBar(controller: _controller),
            ],
          ),
        ),
      );
}

class _BottomSearchBar extends StatelessWidget {
  const _BottomSearchBar({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsetsDirectional.zero,
                  prefixIcon: Icon(PhosphorIcons.regular.magnifyingGlass),
                  hintText: UserText.searchCurrencyNameOrCode,
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox.square(
              dimension: 48,
              child: FloatingActionButton(
                elevation: 0,
                child: Icon(PhosphorIcons.regular.plus),
                onPressed: () {},
              ),
            )
          ],
        ),
      );
}
