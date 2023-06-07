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
class DriftDB extends _$DriftDB {
  static final instance = DriftDB();

  DriftDB() : super(_openConnection());

  //* Increase this number whenever schema is changed
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() => LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      if (kDebugMode) {
        await file.delete(recursive: true);
        await file.create(recursive: true);
      }
      return NativeDatabase.createInBackground(file);
    });

class CurrencyTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().withLength(min: 3, max: 8)();
  IntColumn get scale => integer().withDefault(const Constant(4))();
  TextColumn get symbol => text().withLength(min: 1, max: 6)();
  BoolColumn get invertSeparators =>
      boolean().withDefault(const Constant(false))();
  TextColumn get pattern =>
      text().withLength(min: 2).withDefault(const Constant('S0.00'))();
  TextColumn get country => text().nullable()();
  TextColumn get unit => text().nullable()();
  TextColumn get name => text().nullable()();
  BoolColumn get lastModifiedByServer =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastModified =>
      dateTime().withDefault(Constant(DateTime.now()))();
}
