import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:money2/money2.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:vlsid/vlsid.dart';

import '../../app/app.dart';
import '../core.dart';

part 'local_db.g.dart';
part 'local_db.tables.dart';

@DriftDatabase(
  tables: [AccountTable, CurrencyTable, IconTable],
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

  LocalDB._() : super(_openConnection());
  LocalDB.test(super.e);

  //* Increase this number whenever schema is changed
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          final assetCurrenciesCompanion = await _loadCurrenciesFromAsset();
          await batch((batch) {
            batch.insertAll(currencyTable, assetCurrenciesCompanion);
          });
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

Future<List<CurrencyTableCompanion>> _loadCurrenciesFromAsset() async {
  final String json = await rootBundle.loadString(Assets.json.loadedCurrencies);
  final data = jsonDecode(json) as List;
  final List<CurrencyTableCompanion> currenciesData = data
      .map((e) => _currencyCompanionFromMap(e as Map<String, dynamic>))
      .toList();

  return currenciesData;
}

CurrencyTableCompanion _currencyCompanionFromMap(Map<String, dynamic> map) =>
    CurrencyTableCompanion.insert(
      code: map['code']! as String,
      decimalDigits: 2,
      symbol: map['symbol']! as String,
      pattern: Currency.defaultPattern,
      groupSeparator: ',',
      decimalSeparator: '.',
      country: '',
      unit: '',
      name: map['name']! as String,
    );
