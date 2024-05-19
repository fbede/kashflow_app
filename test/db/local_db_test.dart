/* import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LocalDB db;
  late LocalCurrencyDao dao;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    db = LocalDB.test(NativeDatabase.memory());
    dao = LocalCurrencyDao(db);
  });

  tearDownAll(() async {
    await db.close();
  });

  test(
      '''Tests that the database starts properly and the currencies are properly imported from the json file''',
      () async {
    final numberOfAssetCurrencies = await _numOfCurrenciesInAsset();
    final query = await dao.select(db.currencyTable).get();
    final result = numberOfAssetCurrencies == query.length;

    expect(result, true);
  });
}

Future<int> _numOfCurrenciesInAsset() async {
  final String json = await rootBundle.loadString(Assets.json.loadedCurrencies);
  final data = jsonDecode(json) as List;
  return data.length;
}
 */