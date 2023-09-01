import 'package:flutter/material.dart';
import 'package:kashflow_core/kashflow_core.dart';

class CurrencyFieldController extends TextEditingController {
  CurrencyTableData _currencyData;

  CurrencyFieldController(CurrencyTableData currencyData)
      : _currencyData = currencyData;

  @override
  String get text => '${_currencyData.name} (${_currencyData.code})';

  set currencyData(CurrencyTableData currencyData) {
    _currencyData = currencyData;
    notifyListeners();
  }

  CurrencyTableData get currencyData => _currencyData;
}
