import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:vlsid/vlsid.dart';

import '../../app/app.dart';
import '../core.dart';
import 'functions/functions.dart';

part 'local_db.g.dart';
part 'local_db.tables.dart';

@DriftDatabase(
  tables: [AccountTable, CurrencyTable, IconTable, AssetIconTable],
  daos: [CurrencyDao, AccountDao],
)
class LocalDB extends _$LocalDB {
  static late final LocalDB _instance;
  static bool isInit = false;

  factory LocalDB() {
    if (isInit) {
      return _instance;
    }

    isInit = true;

    if (DartDefine.flavor == Flavor.development) {
      return _instance = LocalDB.test(NativeDatabase.memory());
    } else {
      return _instance = LocalDB._();
    }
  }

  LocalDB._() : super(_openDBConnection());
  LocalDB.test(super.e);

  //* Increase this number whenever schema is changed
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          final assetCurrenciesCompanion = await loadCurrenciesFromAsset();
          final assetIcons = await loadIconsFromAsset();
          await batch((batch) {
            batch
              ..insertAll(currencyTable, assetCurrenciesCompanion)
              ..insertAll(assetIconTable, assetIcons);
          });
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

LazyDatabase _openDBConnection() => LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'database', 'db.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
