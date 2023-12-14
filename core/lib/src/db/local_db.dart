import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:money2/money2.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/v7.dart';

import '../../gen/assets.gen.dart';
import '../account_module/account_dao.dart';
import '../currency_module/currency_dao.dart';
import '../currency_module/currency_extensions.dart';

part 'local_db.g.dart';
part 'local_db.tables.dart';

@DriftDatabase(
  tables: [Accounts, CurrencyTable, IconTable],
  daos: [LocalCurrencyDao, LocalAccountsDao],
)
class LocalDB extends _$LocalDB {
  static late final LocalDB _instance;
  static bool isInit = false;

  factory LocalDB({bool devMode = false}) {
    if (isInit) return _instance;
    isInit = true;
    if (devMode) {
      return _instance = LocalDB.test(NativeDatabase.memory());
    }
    return _instance = LocalDB._();
  }

  LocalDB._() : super(_openConnection());
  LocalDB.test(super.e);

  //* Increase this number whenever schema is changed
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          final assetCurrenciesCompanion =
              (await _loadCurrenciesFromAsset()).map((e) => e.companion);

          await batch((batch) {
            batch.insertAll(currencyTable, assetCurrenciesCompanion);
          });

          //for (final e in assetCurrencies) {
          // await into(currencyTable).insert(e.companion);
          //}
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

LazyDatabase _openConnection() => LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'database', 'db.sqlite'));
      return NativeDatabase.createInBackground(file);
    });

Future<List<Currency>> _loadCurrenciesFromAsset() async {
  final String json = await rootBundle.loadString(Assets.json.loadedCurrencies);
  final data = jsonDecode(json) as List;
  final List<Currency> currenciesData = data
      .map((e) => CurrencyUtil.currencyFromJson(e as Map<String, Object?>))
      .toList();

  return currenciesData;
}
