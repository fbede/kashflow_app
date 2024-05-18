import '../../../core/core.dart';
import '../accounts.dart';

class AccountInteractor {
  final AccountDao _dao;

  AccountInteractor({AccountDao? dao}) : _dao = dao ?? AccountDao(LocalDB());

  AccountInteractor.test(AccountDao dao) : this(dao: dao);

  Stream<List<Account>> watchAllAccounts() => _dao.watchAllAccounts();
}
