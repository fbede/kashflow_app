import '../../../core/db/db.dart';
import '../daos/daos.dart';

class AssetIconInteractor {
  final AssetIconDao _dao;

  AssetIconInteractor({AssetIconDao? dao})
      : _dao = dao ?? AssetIconDao(LocalDB());

  Future<AssetIconTableData> get defaultAccountIcon => _dao.defaultAccountIcon;

  Future<List<AssetIconTableData>> fetchIcons(AssetIconQuery query) =>
      _dao.fetchIcons(query);
}
