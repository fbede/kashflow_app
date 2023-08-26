import 'package:flutter/material.dart';
import 'package:kashflow_core/kashflow_core.dart';

import 'currency_widgets.dart';

extension CurrencyWidgetsExtension on CurrencyTableData {
  CurrencyCardTile buildCardTile({
    required ValueChanged<CurrencyTableData> onTap,
  }) =>
      CurrencyCardTile(item: this, onTap: onTap);
}
