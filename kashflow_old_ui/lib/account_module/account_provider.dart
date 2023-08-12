import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/core/local_db.dart';
import 'account_dao.dart';
import 'account_models.dart';

final accountsProvider =
    AutoDisposeStreamNotifierProvider<AccountsNotifier, List<AccountInfo>>(
  AccountsNotifier.new,
);

class AccountsNotifier extends AutoDisposeStreamNotifier<List<AccountInfo>> {
  final _dao = LocalAccountsDao(LocalDB.instance);

  @override
  Stream<List<AccountInfo>> build() => _dao.watchAllAccounts();

  Future<void> createNewAccount(AccountInfo accountInfo) async =>
      _dao.createNewAccount(accountInfo);

  Future<void> updateAccount(AccountInfo accountInfo) async =>
      _dao.updateAccount(accountInfo);

  Future<void> deleteAccount(String name) => _dao.deleteAccount(name);
}
