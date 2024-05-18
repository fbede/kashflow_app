part of 'local_db.dart';

final _vlsid = Vlsid();

class Currency extends Table {
  TextColumn get id => text().clientDefault(_vlsid.nextId)();
  TextColumn get code => text().withLength(min: 3, max: 10).unique()();
  IntColumn get decimalDigits => integer()();
  TextColumn get symbol => text().withLength(max: 5)();
  TextColumn get pattern => text().withLength(min: 2, max: 10)();
  TextColumn get groupSeparator => text().withLength(max: 5)();
  TextColumn get decimalSeparator => text().withLength(max: 5)();
  TextColumn get country => text()();
  TextColumn get unit => text()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Icon extends Table {
  TextColumn get id => text().clientDefault(_vlsid.nextId)();
  IntColumn get codePoint => integer()();
  TextColumn get fontFamily => text().nullable()();
  TextColumn get fontPackage => text().nullable()();
  BoolColumn get matchTextDirection => boolean()();
  IntColumn get iconColor => integer().nullable()();
  IntColumn get backgroundColor => integer().nullable()();
  TextColumn get fontFamilyFallback =>
      text().map(StringListTypeConverter()).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Account extends Table {
  TextColumn get id => text().references(Icon, #id)();
  TextColumn get name => text().withLength(min: 3, max: 25).unique()();
  TextColumn get currency => text().references(Currency, #id)();
  TextColumn get description => text().withLength(max: 100)();
  Int64Column get openingBalance => int64()();
  //*Note: Generate from Transactions table
  //Int64Column get currentBalance => int64().generatedAs();
  //Int64Column get closingBalance => int64().nullable()();
  //BoolColumn get inSelection => boolean()();
  //BoolColumn get isClosed => boolean()();
  //BoolColumn get isReported => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

// class IncomeCategory extends Table {
//   TextColumn get id => text().references(IconTable, #id)();
//   TextColumn get name => text().withLength(min: 3, max: 25)();
//   TextColumn get description => text().withLength(max: 100)();
//   TextColumn get parent => text().references(IncomeCategory, #name)();

//   @override
//   Set<Column> get primaryKey => {id};
// }

// class ExpenseCategory extends Table {
//   TextColumn get id => text().references(IconTable, #id)();
//   TextColumn get name => text().withLength(min: 3, max: 25)();
//   TextColumn get description => text().withLength(max: 100)();
//   TextColumn get parent => text().references(ExpenseCategory, #name)();

//   @override
//   Set<Column> get primaryKey => {id};
// }

// class Tags extends Table {
//   TextColumn get id => text().clientDefault(() => _uuid.generate())();
//   TextColumn get name => text().withLength(min: 3, max: 25)();
//   TextColumn get description => text().withLength(max: 100)();
//   IntColumn get colorValue => integer()();

//   @override
//   Set<Column> get primaryKey => {id};
// }
