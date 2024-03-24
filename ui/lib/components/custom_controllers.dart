import 'package:flutter/material.dart';
import 'package:kashflow_core/kashflow_core.dart';

class CurrencyFieldController extends TextEditingController {
  AppCurrency _currencyData;

  CurrencyFieldController(AppCurrency currencyData)
      : _currencyData = currencyData;

  @override
  String get text => '${_currencyData.name} (${_currencyData.code})';

  set currencyData(AppCurrency currencyData) {
    _currencyData = currencyData;
    notifyListeners();
  }

  AppCurrency get currencyData => _currencyData;
}
