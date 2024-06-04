import 'package:drift/drift.dart';

import '../../../core/core.dart';
import '../../app.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [AccountTable, CurrencyTable])
class AccountDao extends DatabaseAccessor<LocalDB> with _$AccountDaoMixin {
  AccountDao(super.attachedDatabase);

  Stream<List<AccountViewDTO>> watchAllAccounts() async* {
    try {
      final stream = select(accountTable).join([
        leftOuterJoin(
          currencyTable,
          currencyTable.id.equalsExp(accountTable.currency),
        ),
        leftOuterJoin(
          assetIconTable,
          assetIconTable.name.equalsExp(accountTable.icon),
        ),
      ]).watch();

      await for (final List<TypedResult> event in stream) {
        yield event
            .map<AccountViewDTO>(
              (e) => AccountViewDTO(
                accountData: e.readTable(accountTable),
                currencyData: e.readTable(currencyTable),
                iconData: e.readTable(assetIconTable),
              ),
            )
            .toList();
      }
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }

  Future<void> createNewAccount(CreateAccountDTO account) async {
    try {
      await super
          .attachedDatabase
          .managers
          .accountTable
          .create((_) => account.companion);
    } on Exception catch (e, s) {
      talker.handle(e, s);
    }
  }

  Future<void> updateAccount(EditAccountDTO account) async {
    try {
      await super
          .attachedDatabase
          .managers
          .accountTable
          .filter((f) => f.id.equals(account.id))
          .update((_) => account.companion);
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }

  Future<void> deleteAccount(String id) async {
    try {
      await super
          .attachedDatabase
          .managers
          .accountTable
          .filter((f) => f.id.equals(id))
          .delete();
    } on Exception {
      rethrow;
    }
  }
}
