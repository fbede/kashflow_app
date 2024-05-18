import 'package:drift/drift.dart';

import '../../../core/core.dart';
import '../../app.dart' as app;

part 'account_dao.g.dart';

@DriftAccessor(tables: [Account, Currency, Icon])
class AccountDao extends DatabaseAccessor<LocalDB> with _$AccountDaoMixin {
  AccountDao(super.attachedDatabase);

  Stream<List<app.Account>> watchAllAccounts() async* {
    try {
      final stream = select(account).join([
        leftOuterJoin(
          currency,
          currency.id.equalsExp(account.currency),
        ),
        leftOuterJoin(icon, icon.id.equalsExp(account.id)),
      ]).watch();

      await for (final List<TypedResult> event in stream) {
        yield event
            .map<app.Account>(
              (e) => app.Account(
                accountData: e.readTable(account),
                currencyData: e.readTable(currency),
                iconData: e.readTable(icon),
              ),
            )
            .toList();
      }
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }

  Future<void> createNewAccount(Account account) async {
    talker.log(account);
    try {
      await transaction(() async {
        await into(icon).insertReturning(
          account.icon.companion,
          mode: InsertMode.insert,
        );

        await into(account).insert(account.companion);
      });
    } on Exception catch (e, s) {
      talker.handle(e, s);
    }
  }

  Future<void> updateAccount(Account account) async {
    try {
      await transaction(() async {
        await Future.wait([
          update(icon).replace(account.iconData.companion),
          update(account).replace(account.companion),
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
