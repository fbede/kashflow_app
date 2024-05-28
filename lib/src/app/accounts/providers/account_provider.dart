import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../accounts.dart';

part 'account_provider.g.dart';

@riverpod
class Account extends _$Account {
  final _interactor = AccountInteractor();

  @override
  Stream<List<AccountOld>> build() => _interactor.watchAllAccounts();

  // Future<void> createNewAccount(Account account) async =>
  //     _interactor.createNewAccount(account);

  // Future<void> updateAccount(Account account) async =>
  //     _interactor.updateAccount(account);

  // Future<void> deleteAccount(String name) => _interactor.deleteAccount(name);
}
