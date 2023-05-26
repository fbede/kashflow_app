import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../currency module/currency_dao.dart';

part 'drift_db.g.dart';

@DriftDatabase(
  tables: [DBCurrency],
  daos: [CurrencyDao],
)
class DriftDB extends _$DriftDB {
  DriftDB() : super(_openConnection());

  //* Increase this number whenever schema is changed
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() => LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase.createInBackground(file);
    });

class DBCurrency extends Table {
  TextColumn get id => text().unique()();
  TextColumn get code => text().unique().withLength(min: 3, max: 8)();
  IntColumn get scale => integer().withDefault(const Constant(4))();
  TextColumn get symbol => text().withLength(min: 1, max: 6)();
  BoolColumn get invertSeparators => boolean()();
  TextColumn get pattern => text().withLength(min: 2)();
  TextColumn get country => text().nullable()();
  TextColumn get unit => text().nullable()();
  TextColumn get name => text().nullable()();
  BoolColumn get lastModifiedByServer => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}
