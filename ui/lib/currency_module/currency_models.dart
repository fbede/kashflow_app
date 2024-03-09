import 'package:flutter/material.dart';
import 'package:kashflow_core/kashflow_core.dart';

import 'currency_widgets.dart';

extension CurrencyWidgetsExtension on Currency {
  CurrencyCardTile buildCardTile({
    required ValueChanged<Currency> onTap,
  }) =>
      CurrencyCardTile(item: this, onTap: onTap);
}
