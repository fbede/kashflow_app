import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:kashflow/account%20module/account_models.dart';
import 'package:kashflow/currency%20module/currency_extensions.dart';
import 'package:kashflow/shared/core/local_db.dart';
import 'package:kashflow/shared/core/log_handler.dart';
import 'package:kashflow/shared/models/shared_models.dart';
import 'package:money2/money2.dart';

part 'account_dao.g.dart';
part 'account_dao.helper.dart';

@DriftAccessor(tables: [Accounts, CurrencyTable])
class LocalAccountsDao extends DatabaseAccessor<LocalDB>
    with _$LocalAccountsDaoMixin {
  LocalAccountsDao(super.attachedDatabase);

  Stream<List<AccountInfo>> watchAllAccounts() async* {
    try {
      final stream = select(accounts).join([crossJoin(currencyTable)]).watch();

      await for (final List<TypedResult> event in stream) {
        yield event.map<AccountInfo>((e) {
          final money = _getMoneyFromResult(
            result: e,
            accountsTable: accounts,
            currencyTable: currencyTable,
          );

          final iconInfo =
              _getIconInfoFromResult(result: e, accountsTable: accounts);

          return AccountInfo(
            name: e.read(accounts.name)!,
            openingBalance: money,
            iconInfo: iconInfo,
          );
        }).toList();
      }
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
      rethrow;
    }
  }

  Future<void> createNewAccount(AccountInfo accountInfo) async {
    final currency = accountInfo.openingBalance.currency;

    await transaction(() async {
      await into(currencyTable).insert(
        currency.toTableCompanion(),
        onConflict: DoNothing(),
      );

      await into(accounts).insert(accountInfo.toTableCompanion());
    });
  }

  Future<void> updateAccount(AccountInfo accountInfo) async {
    try {
      final currency = accountInfo.openingBalance.currency;

      await transaction(() async {
        await into(currencyTable).insert(
          currency.toTableCompanion(),
          onConflict: DoNothing(),
        );

        await update(accounts).replace(accountInfo.toTableCompanion());
      });
    } on Exception catch (e, s) {
      Logger.instance.handle(e, s);
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
