import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kashflow/currency_module/currency.dart';
import 'package:kashflow/currency_module/currency_dao.dart';
import 'package:kashflow/gen/assets.gen.dart';
import 'package:kashflow/shared/db/local_db.dart';

void main() {
  late LocalDB db;
  late LocalCurrencyDao dao;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    db = LocalDB.test(NativeDatabase.memory());
    dao = LocalCurrencyDao(db);
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
