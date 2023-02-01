import 'package:drift/drift.dart';
import 'package:money2/money2.dart';

final Currency doge =
    Currency.create('DODG', 8, symbol: 'Ð', pattern: 'S0.00000000');

class DBCurrency extends Table {
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
