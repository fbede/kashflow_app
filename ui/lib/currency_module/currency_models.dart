import 'package:flutter/material.dart';
import 'package:kashflow_core/kashflow_core.dart';

import 'currency_widgets.dart';

extension CurrencyWidgetsExtension on AppCurrency {
  CurrencyCardTile buildCardTile({
    required ValueChanged<AppCurrency> onTap,
  }) =>
      CurrencyCardTile(item: this, onTap: onTap);
}
