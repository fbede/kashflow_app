import 'package:drift/drift.dart';

import '../db/local_db.dart';
import '../logger/log_handler.dart';
import '../models/shared_models.dart';
import 'account_models.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [Accounts, CurrencyTable, IconTable])
class LocalAccountsDao extends DatabaseAccessor<LocalDB>
    with _$LocalAccountsDaoMixin {
  LocalAccountsDao(super.attachedDatabase);

  Stream<List<AccountInfo>> watchAllAccounts() async* {
    try {
      final stream = select(accounts).join([
        leftOuterJoin(
          currencyTable,
          currencyTable.id.equalsExp(accounts.currency),
        ),
        leftOuterJoin(iconTable, iconTable.id.equalsExp(accounts.id)),
      ]).watch();

      await for (final List<TypedResult> event in stream) {
        yield event.map<AccountInfo>((e) {
          final iconTableData = e.readTable(iconTable);
          final accountTableData = e.readTable(accounts);

          return AccountInfo(
            id: accountTableData.id,
            name: accountTableData.name,
            openingBalance: accountTableData.openingBalance,
            iconInfo: IconInfo.fromTableData(iconTableData),
            currencyData: e.readTable(currencyTable),
          );
        }).toList();
      }
    } on Exception catch (e, s) {
      logger.handle(e, s);
      rethrow;
    }
  }

  Future<void> createNewAccount(AccountInfo accountInfo) async {
    final icon = accountInfo.iconInfo;
    var currencyInfo = accountInfo.currencyInfo;
    final currencyHasBeenUsed = currencyInfo.hasBeenUsed;

    await transaction(() async {
      if (!currencyHasBeenUsed) {
        currencyInfo = currencyInfo.copyWith(hasBeenUsed: true);
        await update(currencyTable).replace(currencyInfo);
      }

      final iconData = await into(iconTable).insertReturning(
        icon.companion,
        mode: InsertMode.insert,
      );

      final newAccountInfo = accountInfo.copyWith(id: iconData.id);

      await into(accounts).insert(newAccountInfo.companion);
    });
  }

  Future<void> updateAccount(AccountInfo accountInfo) async {
    try {
      final icon = accountInfo.iconInfo;
      final currencyInfo = accountInfo.currencyInfo.copyWith(hasBeenUsed: true);

      await transaction(() async {
        await Future.wait([
          update(currencyTable).replace(currencyInfo),
          update(iconTable).replace(icon.companion),
          update(accounts).replace(accountInfo.companion),
        ]);
      });
    } on Exception catch (e, s) {
      logger.handle(e, s);
      rethrow;
    }
  }

  Future<void> deleteAccount(String name) async {
    try {
      final query = delete(accounts)..where((tbl) => tbl.name.equals(name));

      await query.go();
    } on Exception {
      rethrow;
    }
  }
}
