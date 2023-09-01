import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kashflow_core/gen/assets.gen.dart';
import 'package:kashflow_core/src/currency_module/currency_dao.dart';
import 'package:kashflow_core/src/currency_module/currency_extensions.dart';
import 'package:kashflow_core/src/db/local_db.dart';
import 'package:money2/money2.dart';

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

Future<List<Currency>> _getAssetCurrencies() async {
  final String json = await rootBundle.loadString(Assets.json.loadedCurrencies);
  final data = jsonDecode(json) as List;
  return data
      .map((e) => CurrencyUtil.currencyFromJson(e as Map<String, Object?>))
      .toList();
}
