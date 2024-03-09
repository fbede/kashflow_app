import 'package:flutter/material.dart';
import 'package:kashflow_core/kashflow_core.dart';

class CurrencyFieldController extends TextEditingController {
  Currency _currencyData;

  CurrencyFieldController(Currency currencyData) : _currencyData = currencyData;

  @override
  String get text => '${_currencyData.name} (${_currencyData.code})';

  set currencyData(Currency currencyData) {
    _currencyData = currencyData;
    notifyListeners();
  }

  Currency get currencyData => _currencyData;
}
