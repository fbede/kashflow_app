import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kashflow/currency_module/currency_dao.dart';
import 'package:kashflow/shared/core/local_db.dart';
import 'package:money2/money2.dart';

void main() {
  late LocalDB db;
  late LocalCurrencyDao dao;

  setUpAll(() {
    db = LocalDB.test(NativeDatabase.memory());
    dao = LocalCurrencyDao(db);
  });

  tearDownAll(() async {
    await db.close();
  });

  test('Tests that the currencydao methods are working', () async {
    final currencyId = await dao.saveCurrencyGetCode(CommonCurrencies().usd);
    expect(currencyId, 1);

    final currency = await dao.getCurrencyById(currencyId);
    expect(currency, CommonCurrencies().usd);

    await expectLater(
      dao.watchAllCurrencies(),
      emits([CommonCurrencies().usd]),
    );
  });
}
