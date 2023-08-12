part of 'local_db.dart';

class CurrencyTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().withLength(min: 3, max: 10)();
  IntColumn get scale => integer()();
  TextColumn get symbol => text()();
  BoolColumn get invertSeparators => boolean()();
  TextColumn get pattern => text().withLength(min: 2)();
  TextColumn get country => text()();
  TextColumn get unit => text()();
  TextColumn get name => text()();
}

class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 3, max: 25)();
  TextColumn get currency => text().references(CurrencyTable, #id)();
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
}

class IncomeCategory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 3, max: 25)();
  TextColumn get description => text().withLength(max: 100)();
  TextColumn get parent => text().references(IncomeCategory, #name)();

  IntColumn get iconCodePoint => integer()();
  TextColumn get iconFontFamily => text().nullable()();
  TextColumn get iconFontPackage => text().nullable()();
  BoolColumn get iconMatchesTextDirection => boolean()();
  IntColumn get iconColorValue => integer()();
  IntColumn get backgroundColorValue => integer()();
}

class ExpenseCategory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 3, max: 25)();
  TextColumn get description => text().withLength(max: 100)();
  TextColumn get parent => text().references(ExpenseCategory, #name)();

  IntColumn get iconCodePoint => integer()();
  TextColumn get iconFontFamily => text().nullable()();
  TextColumn get iconFontPackage => text().nullable()();
  BoolColumn get iconMatchesTextDirection => boolean()();
  IntColumn get iconColorValue => integer()();
  IntColumn get backgroundColorValue => integer()();
}

class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 3, max: 25)();
  TextColumn get description => text().withLength(max: 100)();
  IntColumn get colorValue => integer()();
}
