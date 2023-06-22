import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/local_db.dart';
import 'account_dao.dart';
import 'account_models.dart';

final accountsProvider =
    AutoDisposeStreamNotifierProvider<AccountsNotifier, List<TypedResult>>(
  AccountsNotifier.new,
);

class AccountsNotifier extends AutoDisposeStreamNotifier<List<TypedResult>> {
  final _dao = LocalAccountsDao(LocalDB.instance);

  @override
  Stream<List<TypedResult>> build() => _dao.watchAllAccounts();

  Future<void> createNewAccount(AccountInfo accountInfo) async =>
      _dao.createNewAccount(accountInfo);
}
