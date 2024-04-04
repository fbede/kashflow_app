import 'package:drift/drift.dart';
import 'package:money2/money2.dart';

import '../shared/db/local_db.dart';
import '../shared/logger/log_handler.dart';

import 'account.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [AccountTable, CurrencyTable, IconTable])
class LocalAccountsDao extends DatabaseAccessor<LocalDB>
    with _$LocalAccountsDaoMixin {
  LocalAccountsDao(super.attachedDatabase);

  Stream<List<Account>> watchAllAccounts() async* {
    try {
      final stream = select(accountTable).join([
        leftOuterJoin(
          currencyTable,
          currencyTable.id.equalsExp(accountTable.currency),
        ),
        leftOuterJoin(iconTable, iconTable.id.equalsExp(accountTable.id)),
      ]).watch();

      await for (final List<TypedResult> event in stream) {
        yield event.map<Account>((e) {
          final iconTableData = e.readTable(iconTable);
          final accountTableData = e.readTable(accountTable);
          final currencyTableData = e.readTable(currencyTable);

          return Account(
            id: accountTableData.id,
            name: accountTableData.name,
            description: accountTableData.description,
            openingBalance: Money.fromBigIntWithCurrency(
              accountTableData.openingBalance,
              currencyTableData,
            ),
            iconData: iconTableData,
            currencyId: currencyTableData.id,
          );
        }).toList();
      }
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }

  Future<void> createNewAccount(Account account) async {
    try {
      await transaction(() async {
        await into(iconTable).insertReturning(
          account.iconData.companion,
          mode: InsertMode.insert,
        );

        await into(accountTable).insert(account.companion);
      });
    } on Exception catch (e, s) {
      talker.handle(e, s);
    }
  }

  Future<void> updateAccount(Account account) async {
    try {
      await transaction(() async {
        await Future.wait([
          update(iconTable).replace(account.iconData.companion),
          update(accountTable).replace(account.companion),
        ]);
      });
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }

  Future<void> deleteAccount(String name) async {
    try {
      final query = delete(accountTable)..where((tbl) => tbl.name.equals(name));

      await query.go();
    } on Exception {
      rethrow;
    }
  }
}
