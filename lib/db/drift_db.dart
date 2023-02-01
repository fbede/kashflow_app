import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:kashflow/db/currency_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_db.g.dart';

@DriftDatabase(tables: [DBCurrency])
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
