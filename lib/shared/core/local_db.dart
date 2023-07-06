import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:kashflow/account%20module/account_dao.dart';
import 'package:kashflow/currency%20module/currency_dao.dart';
// import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'local_db.g.dart';

@DriftDatabase(
  tables: [CurrencyTable, Accounts],
  daos: [LocalCurrencyDao, LocalAccountsDao],
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
  TextColumn get code => text().withLength(min: 3, max: 10)();
  IntColumn get scale => integer()();
  TextColumn get symbol => text()();
  BoolColumn get invertSeparators => boolean()();
  TextColumn get pattern => text().withLength(min: 2)();
  TextColumn get country => text()();
  TextColumn get unit => text()();
  TextColumn get name => text()();

  @override
  Set<Column<Object>>? get primaryKey => {code};
}

class Accounts extends Table {
  TextColumn get name => text().withLength(min: 3, max: 25)();
  TextColumn get currency => text().references(CurrencyTable, #code)();
  Int64Column get openingBalance => int64()();
  //*Note: Generate from Transactions table
  //Int64Column get currentBalance => int64().generatedAs();
  Int64Column get closingBalance => int64().nullable()();
  //BoolColumn get inSelection => boolean()();
  //BoolColumn get isReported => boolean()();
  TextColumn get description => text().withLength(max: 100)();
  IntColumn get iconCodePoint => integer()();
  TextColumn get iconFontFamily => text().nullable()();
  TextColumn get iconFontPackage => text().nullable()();
  BoolColumn get iconMatchesTextDirection => boolean()();
  IntColumn get iconColorValue => integer()();
  IntColumn get backgroundColorValue => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {name};
}

class IncomeCategory extends Table {
  TextColumn get name => text().withLength(min: 3, max: 25)();
  TextColumn get description => text().withLength(max: 100)();
  TextColumn get parent => text().references(IncomeCategory, #name)();

  IntColumn get iconCodePoint => integer()();
  TextColumn get iconFontFamily => text().nullable()();
  TextColumn get iconFontPackage => text().nullable()();
  BoolColumn get iconMatchesTextDirection => boolean()();
  IntColumn get iconColorValue => integer()();
  IntColumn get backgroundColorValue => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {name};
}

class ExpenseCategory extends Table {
  TextColumn get name => text().withLength(min: 3, max: 25)();
  TextColumn get description => text().withLength(max: 100)();
  TextColumn get parent => text().references(ExpenseCategory, #name)();

  IntColumn get iconCodePoint => integer()();
  TextColumn get iconFontFamily => text().nullable()();
  TextColumn get iconFontPackage => text().nullable()();
  BoolColumn get iconMatchesTextDirection => boolean()();
  IntColumn get iconColorValue => integer()();
  IntColumn get backgroundColorValue => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {name};
}

class Tags extends Table {
  TextColumn get name => text().withLength(min: 3, max: 25)();
  TextColumn get description => text().withLength(max: 100)();
  IntColumn get colorValue => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {name};
}
