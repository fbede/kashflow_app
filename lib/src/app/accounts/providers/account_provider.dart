import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../accounts.dart';
import '../interactors/account_interactor.dart';

part 'account_provider.g.dart';

@riverpod
class AccountProvider extends _$AccountProvider {
  final AccountInteractor _interactor;

  AccountProvider({AccountInteractor? interactor})
      : _interactor = interactor ?? AccountInteractor();

  @override
  Stream<List<Account>> build() => _interactor.watchAllAccounts();

  // Future<void> createNewAccount(Account account) async =>
  //     _interactor.createNewAccount(account);

  // Future<void> updateAccount(Account account) async =>
  //     _interactor.updateAccount(account);

  // Future<void> deleteAccount(String name) => _interactor.deleteAccount(name);
}
