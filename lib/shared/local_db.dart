import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../currency module/currency_dao.dart';

part 'local_db.g.dart';

@DriftDatabase(
  tables: [CurrencyTable, TransactionCategory],
  daos: [LocalCurrencyDao],
)
class LocalDB extends _$LocalDB {
  static final instance = LocalDB();

  LocalDB() : super(_openConnection());

  LocalDB.test(super.e);

  //* Increase this number whenever schema is changed
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

LazyDatabase _openConnection() => LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'database', 'db.sqlite'));
      /*if (kDebugMode & file.existsSync()) {
        await file.delete(recursive: true);
        await file.create(recursive: true);
      }*/
      return NativeDatabase.createInBackground(file);
    });

class CurrencyTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().withLength(min: 3, max: 8).unique()();
  IntColumn get scale => integer()();
  TextColumn get symbol => text()();
  BoolColumn get invertSeparators => boolean()();
  TextColumn get pattern => text().withLength(min: 2)();
  TextColumn get country => text()();
  TextColumn get unit => text()();
  TextColumn get name => text()();
}

class TransactionCategory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get description => text()();
  IntColumn get parent => integer().nullable().references(
        TransactionCategory,
        #id,
        onUpdate: KeyAction.noAction,
        onDelete: KeyAction.noAction,
      )();
  IntColumn get children => integer().nullable().references(
        TransactionCategory,
        #id,
        onUpdate: KeyAction.noAction,
        onDelete: KeyAction.cascade,
      )();
}

class Account extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  IntColumn get currency => integer().references(CurrencyTable, #id)();
  Int64Column get openingBalance => int64()();
  Int64Column get currentBalance => int64()();
  Int64Column get closingBalance => int64().nullable()();
  BoolColumn get inSelection => boolean()();
  BoolColumn get isReported => boolean()();
}
