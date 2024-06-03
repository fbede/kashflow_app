import '../../../core/core.dart';
import '../accounts.dart';

class AccountInteractor {
  final AccountDao _dao;

  AccountInteractor({AccountDao? dao}) : _dao = dao ?? AccountDao(LocalDB());

  AccountInteractor.test(AccountDao dao) : this(dao: dao);

  Stream<List<Account>> watchAllAccounts() => _dao.watchAllAccounts();

  Future<void> createNewAccount(CreateAccountDTO account) =>
      _dao.createNewAccount(account);

  Future<void> updateAccount(EditAccountDTO account) =>
      _dao.updateAccount(account);

  Future<void> deleteAccount(String id) => _dao.deleteAccount(id);
}
