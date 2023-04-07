import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:kashflow/db/currency_dao.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_db.g.dart';

@DriftDatabase(
  tables: [DBCurrency],
  daos: [CurrencyDao],
)
class DriftDB extends _$DriftDB {
  DriftDB() : super(_openConnection());

  //! Increase this number whenever schema is changed
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

class DBCurrency extends Table {
  TextColumn get code => text().unique().withLength(min: 3, max: 8)();
  IntColumn get scale => integer()();
  TextColumn get symbol => text().withLength(min: 1, max: 6)();
  TextColumn get pattern => text().withLength(min: 2)();
  BoolColumn get invertSeparators => boolean()();
  TextColumn get country => text().nullable()();
  TextColumn get unit => text().nullable()();
  TextColumn get name => text().nullable()();
  BoolColumn get isDefault => boolean()();
  BoolColumn get lastModifiedByServer => boolean()();

  @override
  Set<Column> get primaryKey => {code};
}
