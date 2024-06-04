import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../accounts.dart';

part 'accounts_provider.g.dart';

@riverpod
class Accounts extends _$Accounts {
  final _interactor = AccountInteractor();

  @override
  Stream<List<AccountViewDTO>> build() => _interactor.watchAllAccounts();

  Future<void> createNewAccount(CreateAccountDTO account) async =>
      _interactor.createNewAccount(account);

  Future<void> updateAccount(EditAccountDTO account) async =>
      _interactor.updateAccount(account);

  Future<void> deleteAccount(String id) => _interactor.deleteAccount(id);
}
