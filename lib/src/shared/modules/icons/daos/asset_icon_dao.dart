import 'package:drift/drift.dart';

import '../../../../core/core.dart';

part 'asset_icon_dao.g.dart';

typedef AssetIconQuery = ({String searchTerm, int pageSize, int page});

@DriftAccessor(tables: [AssetIconTable])
class AssetIconDao extends DatabaseAccessor<LocalDB> with _$AssetIconDaoMixin {
  AssetIconDao(super.attachedDatabase);

  Future<AssetIconTableData> get defaultAccountIcon {
    try {
      return super
          .attachedDatabase
          .managers
          .assetIconTable
          .filter(
            (e) => e.name.equals('wallet'),
          )
          .getSingle();
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }

  Future<List<AssetIconTableData>> fetchIcons(
    AssetIconQuery query,
  ) async {
    try {
      return await super
          .attachedDatabase
          .managers
          .assetIconTable
          .filter(
            (e) =>
                e.name.contains(query.searchTerm) |
                e.tags.contains(query.searchTerm) |
                e.categories.contains(query.searchTerm),
          )
          .get(
            limit: query.pageSize,
            offset: (query.page - 1) * query.pageSize,
          );
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }
}
