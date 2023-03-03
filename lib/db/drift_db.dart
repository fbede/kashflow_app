import 'dart:convert';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:kashflow/db/currency_dao.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_db.g.dart';

@DriftDatabase(
  tables: [UserCurrency, PreloadedCurrency],
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

class UserCurrency extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get language => text().withLength(min: 6, max: 32)();
  TextColumn get code => text().withLength(min: 6, max: 32)();
  IntColumn get scale => integer()();
  TextColumn get symbol => text().withLength(min: 6, max: 32)();
  TextColumn get pattern => text().withLength(min: 6, max: 32)();
  BoolColumn get invertSeparators => boolean()();
  TextColumn get country => text().nullable()();
  TextColumn get unit => text()();
  TextColumn get name => text()();
  BoolColumn get isDefault => boolean()();
}

class PreloadedCurrency extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().withLength(min: 6, max: 32)();
  TextColumn get name => text()();
  TextColumn get symbol => text().withLength(min: 6, max: 32)();
}
