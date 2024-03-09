part of 'local_db.dart';

const _uuid = UuidV7();

@UseRowClass(Currency)
class CurrencyTable extends Table {
  TextColumn get id => text()();
  BoolColumn get hasBeenUsed => boolean()();
  TextColumn get code => text().withLength(min: 3, max: 10).unique()();
  IntColumn get scale => integer()();
  TextColumn get symbol => text().withLength(max: 10)();
  BoolColumn get invertSeparators => boolean()();
  TextColumn get pattern => text().withLength(min: 2)();
  TextColumn get country => text()();
  TextColumn get unit => text()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class IconTable extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.generate())();
  IntColumn get codePoint => integer()();
  TextColumn get fontFamily => text().nullable()();
  TextColumn get fontPackage => text().nullable()();
  BoolColumn get matchTextDirection => boolean()();
  IntColumn get colorValue => integer()();
  IntColumn get backgroundColorValue => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class Accounts extends Table {
  TextColumn get id => text().references(IconTable, #id)();
  TextColumn get name => text().withLength(min: 3, max: 25).unique()();
  TextColumn get currency => text().references(CurrencyTable, #id)();
  TextColumn get description => text().withLength(max: 100)();
  Int64Column get openingBalance => int64()();
  //*Note: Generate from Transactions table
  //Int64Column get currentBalance => int64().generatedAs();
  Int64Column get closingBalance => int64().nullable()();
  //BoolColumn get inSelection => boolean()();
  //BoolColumn get isReported => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

class IncomeCategory extends Table {
  TextColumn get id => text().references(IconTable, #id)();
  TextColumn get name => text().withLength(min: 3, max: 25)();
  TextColumn get description => text().withLength(max: 100)();
  TextColumn get parent => text().references(IncomeCategory, #name)();

  @override
  Set<Column> get primaryKey => {id};
}

class ExpenseCategory extends Table {
  TextColumn get id => text().references(IconTable, #id)();
  TextColumn get name => text().withLength(min: 3, max: 25)();
  TextColumn get description => text().withLength(max: 100)();
  TextColumn get parent => text().references(ExpenseCategory, #name)();

  @override
  Set<Column> get primaryKey => {id};
}

class Tags extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.generate())();
  TextColumn get name => text().withLength(min: 3, max: 25)();
  TextColumn get description => text().withLength(max: 100)();
  IntColumn get colorValue => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
