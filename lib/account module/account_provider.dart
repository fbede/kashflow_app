import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/account%20module/account_dao.dart';
import 'package:kashflow/account%20module/account_models.dart';
import 'package:kashflow/shared/core/local_db.dart';

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
