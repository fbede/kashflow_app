import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow_core/kashflow_core.dart';

final accountsProvider =
    AutoDisposeStreamNotifierProvider<AccountsNotifier, List<AccountInfo>>(
  AccountsNotifier.new,
);

class AccountsNotifier extends AutoDisposeStreamNotifier<List<AccountInfo>> {
  final _dao = LocalAccountsDao(LocalDB());

  @override
  Stream<List<AccountInfo>> build() => _dao.watchAllAccounts();

  Future<void> createNewAccount(AccountInfo accountInfo) async =>
      _dao.createNewAccount(accountInfo);

  Future<void> updateAccount(AccountInfo accountInfo) async =>
      _dao.updateAccount(accountInfo);

  Future<void> deleteAccount(String name) => _dao.deleteAccount(name);
}
