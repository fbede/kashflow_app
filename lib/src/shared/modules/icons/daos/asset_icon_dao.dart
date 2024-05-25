import 'package:drift/drift.dart';

import '../../../../core/core.dart';

part 'asset_icon_dao.g.dart';

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

  Stream<List<AssetIconTableData>> watchIcons(String searchTerm) async* {
    try {
      yield* super
          .attachedDatabase
          .managers
          .assetIconTable
          .filter(
            (e) =>
                e.name.contains(searchTerm) |
                e.tags.contains(searchTerm) |
                e.categories.contains(searchTerm),
          )
          .watch();
    } on Exception catch (e, s) {
      talker.handle(e, s);
      rethrow;
    }
  }
}
