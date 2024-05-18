import 'package:drift/drift.dart';

import '../../../core/core.dart';
import '../../app.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [AccountTable, CurrencyTable, IconTable])
class AccountDao extends DatabaseAccessor<LocalDB> with _$AccountDaoMixin {
  AccountDao(super.attachedDatabase);

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
        yield event
            .map<Account>(
              (e) => Account(
                accountData: e.readTable(accountTable),
                currencyData: e.readTable(currencyTable),
                iconData: e.readTable(iconTable),
              ),
            )
            .toList();
      }
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }

  // Future<void> createNewAccount(Account account) async {
  //   talker.log(account);
  //   try {
  //     await transaction(() async {
  //       await into(icon).insertReturning(
  //         account.icon.companion,
  //         mode: InsertMode.insert,
  //       );

  //     //  await into(account).insert(account.companion);
  //     });
  //   } on Exception catch (e, s) {
  //     talker.handle(e, s);
  //   }
  // }

  // Future<void> updateAccount(Account account) async {
  //   try {
  //     await transaction(() async {
  //       await Future.wait([
  //         update(icon).replace(account.iconData.companion),
  //         update(account).replace(account.companion),
  //       ]);
  //     });
  //   } on Exception catch (e, s) {
  //     talker.handle(e, s);
  //     rethrow;
  //   }
  // }

  // Future<void> deleteAccount(String name) async {
  //   try {
  //     final query = delete(accountTable)..where((tbl) => tbl.name.equals(name));

  //     await query.go();
  //   } on Exception {
  //     rethrow;
  //   }
  // }
}
