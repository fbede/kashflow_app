import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../currency module/currency_dao.dart';

part 'drift_db.g.dart';

@DriftDatabase(
  tables: [CurrencyTable],
  daos: [LocalCurrencyDao],
)
class LocalDB extends _$LocalDB {
  static final instance = LocalDB();

  LocalDB() : super(_openConnection());

  //* Increase this number whenever schema is changed
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() => LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'database', 'db.sqlite'));
      if (kDebugMode & file.existsSync()) {
        await file.delete(recursive: true);
        await file.create(recursive: true);
      }
      return NativeDatabase.createInBackground(file);
    });

class CurrencyTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().withLength(min: 3, max: 8).unique()();
  IntColumn get scale => integer().withDefault(const Constant(4))();
  TextColumn get symbol => text()();
  BoolColumn get invertSeparators =>
      boolean().withDefault(const Constant(false))();
  TextColumn get pattern =>
      text().withLength(min: 2).withDefault(const Constant('S0.00'))();
  TextColumn get country => text()();
  TextColumn get unit => text()();
  TextColumn get name => text()();
  BoolColumn get lastModifiedByServer =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastModified =>
      dateTime().withDefault(Constant(DateTime.now()))();
}
