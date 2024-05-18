import 'package:flutter/material.dart';

import '../../../shared/modules/icons/icons.dart';

/* class CurrencyFormField extends StatelessWidget {
  const CurrencyFormField({
    required this.appCurrencyController,
    required this.textController,
    super.key,
  });

  final AppCurrencyController appCurrencyController;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) => TextFormField(
        readOnly: true,
        controller: textController,
        showCursor: false,
        onTap: () async => _onCurrencyTap(context),
        decoration: const InputDecoration(
          isDense: true,
          labelText: UserText.currency,
          prefixIcon: Icon(RemixIcons.cash_line),
        ),
        validator: _validator,
      );

  String? _validator(String? v) {
    if (v == null || v.isEmpty) {
      return UserText.cannotBeEmpty;
    }
    return null;
  }

  Future<void> _onCurrencyTap(BuildContext context) async {
    final result = await showCurrencyPicker(context, '');
    if (result != null) {
      appCurrencyController.currency = result;
    }
  }
}
 */