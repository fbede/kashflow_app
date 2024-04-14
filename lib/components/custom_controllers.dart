import 'package:flutter/material.dart';

import '../currency_module/currency.dart';

class AppCurrencyController extends ChangeNotifier {
  AppCurrency _currencyData;

  AppCurrencyController(AppCurrency currencyData)
      : _currencyData = currencyData;

  String get text => '${_currencyData.name} (${_currencyData.code})';

  set currency(AppCurrency currencyData) {
    _currencyData = currencyData;
    notifyListeners();
  }

  AppCurrency get currency => _currencyData;
}
