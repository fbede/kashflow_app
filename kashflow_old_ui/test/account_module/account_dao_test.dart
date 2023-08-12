import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kashflow/account_module/account_dao.dart';
import 'package:kashflow/shared/core/local_db.dart';
import 'package:kashflow/shared/core/log_handler.dart';

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
      dao.watchAllAccounts().map(Logger.instance.log);
    });
  });
}
