import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kashflow/account%20module/account_dao.dart';
import 'package:kashflow/shared/local_db.dart';
import 'package:money2/money2.dart';

void main() {
  late LocalDB db;
  late LocalAccountsDao dao;

  setUpAll(() {
    db = LocalDB.test(NativeDatabase.memory());
    dao = LocalAccountsDao(db);
  });

  tearDownAll(() async {
    await db.close();
  });

  test('', () async {
    await Future.delayed(const Duration(seconds: 2), () {
      dao.watchAllAccounts().map(print);
    });

    // dao.watchAllAccounts().map(print);
    // await expectLater(dao.watchAllAccounts(), emits([CommonCurrencies().usd]));
  });
}
