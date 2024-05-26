import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/core.dart';
import 'widgets.dart';

class CurrencyFormField extends StatelessWidget {
  const CurrencyFormField({
    required this.currencyController,
    required this.textController,
    super.key,
  });

  final CurrencyFormFieldController currencyController;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    final text = context.t.currency_module.currency_form_field;

    return TextFormField(
      readOnly: true,
      controller: textController,
      showCursor: false,
      onTap: () async => _onCurrencyTap(context),
      decoration: InputDecoration(
        isDense: true,
        labelText: text.currency,
        prefixIcon: const Icon(LucideIcons.circleDollarSign),
      ),
      validator: (v) => _validator(v, context),
    );
  }

  String? _validator(String? v, BuildContext context) {
    final text = context.t.currency_module.currency_form_field;

    if (v == null || v.isEmpty) {
      return text.cannot_be_empty;
    }
    return null;
  }

  Future<void> _onCurrencyTap(BuildContext context) async {
    final text = context.t.currency_module.currency_form_field;
    final result = await showCurrencyPicker(context, text.select_currency);
    if (result != null) {
      currencyController.currency = result;
    }
  }
}

class CurrencyFormFieldController extends ChangeNotifier {
  CurrencyTableData _currencyData;

  CurrencyFormFieldController(CurrencyTableData currencyData)
      : _currencyData = currencyData;

  String get text => '${_currencyData.name} (${_currencyData.code})';

  set currency(CurrencyTableData currencyData) {
    _currencyData = currencyData;
    notifyListeners();
  }

  CurrencyTableData get currency => _currencyData;
}
