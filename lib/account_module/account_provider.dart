import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../shared/db/local_db.dart';
import 'account.dart' as model;
import 'account_dao.dart';

part 'account_provider.g.dart';

@riverpod
class Account extends _$Account {
  final _dao = LocalAccountsDao(LocalDB());

  @override
  Stream<List<model.Account>> build() => _dao.watchAllAccounts();

  Future<void> createNewAccount(model.Account account) async =>
      _dao.createNewAccount(account);

  Future<void> updateAccount(model.Account account) async =>
      _dao.updateAccount(account);

  Future<void> deleteAccount(String name) => _dao.deleteAccount(name);
}
