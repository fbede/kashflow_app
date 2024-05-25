import '../../../../core/db/db.dart';
import '../daos/daos.dart';

class AssetIconInteractor {
  final AssetIconDao _dao;

  AssetIconInteractor({AssetIconDao? dao})
      : _dao = dao ?? AssetIconDao(LocalDB());

  Future<AssetIconTableData> get defaultAccountIcon => _dao.defaultAccountIcon;

  Stream<List<AssetIconTableData>> watchIcons(String searchTerm) =>
      _dao.watchIcons(searchTerm);
}
