/* import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kashflow/src/app/app.dart';
import 'package:kashflow/src/core/core.dart';

void main() {
  late LocalDB db;
  late CurrencyDao dao;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    db = LocalDB.test(NativeDatabase.memory());
    dao = CurrencyDao(db);
  });

  tearDownAll(() async {
    await db.close();
  });

  test('Tests that the watchAllCurrencies method is working', () async {
    final assetCurrencies = await _getAssetCurrencies();

    await expectLater(dao.watchOtherCurrencies(), emits(assetCurrencies));
  });
}

Future<List<AppCurrency>> _getAssetCurrencies() async {
  final String json = await rootBundle.loadString(Assets.json.loadedCurrencies);
  final data = jsonDecode(json) as List;
  return data
      .map((e) => AppCurrency.currencyFromJson(e as Map<String, Object?>))
      .toList();
}
 */
