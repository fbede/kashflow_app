// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// ignore_for_file: type=lint
class $CurrencyTableTable extends CurrencyTable
    with TableInfo<$CurrencyTableTable, CurrencyTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrencyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 8),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _scaleMeta = const VerificationMeta('scale');
  @override
  late final GeneratedColumn<int> scale = GeneratedColumn<int>(
      'scale', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _invertSeparatorsMeta =
      const VerificationMeta('invertSeparators');
  @override
  late final GeneratedColumn<bool> invertSeparators =
      GeneratedColumn<bool>('invert_separators', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("invert_separators" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _patternMeta =
      const VerificationMeta('pattern');
  @override
  late final GeneratedColumn<String> pattern =
      GeneratedColumn<String>('pattern', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 2,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, code, scale, symbol, invertSeparators, pattern, country, unit, name];
  @override
  String get aliasedName => _alias ?? 'currency_table';
  @override
  String get actualTableName => 'currency_table';
  @override
  VerificationContext validateIntegrity(Insertable<CurrencyTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('scale')) {
      context.handle(
          _scaleMeta, scale.isAcceptableOrUnknown(data['scale']!, _scaleMeta));
    } else if (isInserting) {
      context.missing(_scaleMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('invert_separators')) {
      context.handle(
          _invertSeparatorsMeta,
          invertSeparators.isAcceptableOrUnknown(
              data['invert_separators']!, _invertSeparatorsMeta));
    } else if (isInserting) {
      context.missing(_invertSeparatorsMeta);
    }
    if (data.containsKey('pattern')) {
      context.handle(_patternMeta,
          pattern.isAcceptableOrUnknown(data['pattern']!, _patternMeta));
    } else if (isInserting) {
      context.missing(_patternMeta);
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CurrencyTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      scale: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}scale'])!,
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      invertSeparators: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}invert_separators'])!,
      pattern: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pattern'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CurrencyTableTable createAlias(String alias) {
    return $CurrencyTableTable(attachedDatabase, alias);
  }
}

class CurrencyTableData extends DataClass
    implements Insertable<CurrencyTableData> {
  final int id;
  final String code;
  final int scale;
  final String symbol;
  final bool invertSeparators;
  final String pattern;
  final String country;
  final String unit;
  final String name;
  const CurrencyTableData(
      {required this.id,
      required this.code,
      required this.scale,
      required this.symbol,
      required this.invertSeparators,
      required this.pattern,
      required this.country,
      required this.unit,
      required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['scale'] = Variable<int>(scale);
    map['symbol'] = Variable<String>(symbol);
    map['invert_separators'] = Variable<bool>(invertSeparators);
    map['pattern'] = Variable<String>(pattern);
    map['country'] = Variable<String>(country);
    map['unit'] = Variable<String>(unit);
    map['name'] = Variable<String>(name);
    return map;
  }

  CurrencyTableCompanion toCompanion(bool nullToAbsent) {
    return CurrencyTableCompanion(
      id: Value(id),
      code: Value(code),
      scale: Value(scale),
      symbol: Value(symbol),
      invertSeparators: Value(invertSeparators),
      pattern: Value(pattern),
      country: Value(country),
      unit: Value(unit),
      name: Value(name),
    );
  }

  factory CurrencyTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyTableData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      scale: serializer.fromJson<int>(json['scale']),
      symbol: serializer.fromJson<String>(json['symbol']),
      invertSeparators: serializer.fromJson<bool>(json['invertSeparators']),
      pattern: serializer.fromJson<String>(json['pattern']),
      country: serializer.fromJson<String>(json['country']),
      unit: serializer.fromJson<String>(json['unit']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'scale': serializer.toJson<int>(scale),
      'symbol': serializer.toJson<String>(symbol),
      'invertSeparators': serializer.toJson<bool>(invertSeparators),
      'pattern': serializer.toJson<String>(pattern),
      'country': serializer.toJson<String>(country),
      'unit': serializer.toJson<String>(unit),
      'name': serializer.toJson<String>(name),
    };
  }

  CurrencyTableData copyWith(
          {int? id,
          String? code,
          int? scale,
          String? symbol,
          bool? invertSeparators,
          String? pattern,
          String? country,
          String? unit,
          String? name}) =>
      CurrencyTableData(
        id: id ?? this.id,
        code: code ?? this.code,
        scale: scale ?? this.scale,
        symbol: symbol ?? this.symbol,
        invertSeparators: invertSeparators ?? this.invertSeparators,
        pattern: pattern ?? this.pattern,
        country: country ?? this.country,
        unit: unit ?? this.unit,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('CurrencyTableData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('scale: $scale, ')
          ..write('symbol: $symbol, ')
          ..write('invertSeparators: $invertSeparators, ')
          ..write('pattern: $pattern, ')
          ..write('country: $country, ')
          ..write('unit: $unit, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, code, scale, symbol, invertSeparators, pattern, country, unit, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyTableData &&
          other.id == this.id &&
          other.code == this.code &&
          other.scale == this.scale &&
          other.symbol == this.symbol &&
          other.invertSeparators == this.invertSeparators &&
          other.pattern == this.pattern &&
          other.country == this.country &&
          other.unit == this.unit &&
          other.name == this.name);
}

class CurrencyTableCompanion extends UpdateCompanion<CurrencyTableData> {
  final Value<int> id;
  final Value<String> code;
  final Value<int> scale;
  final Value<String> symbol;
  final Value<bool> invertSeparators;
  final Value<String> pattern;
  final Value<String> country;
  final Value<String> unit;
  final Value<String> name;
  const CurrencyTableCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.scale = const Value.absent(),
    this.symbol = const Value.absent(),
    this.invertSeparators = const Value.absent(),
    this.pattern = const Value.absent(),
    this.country = const Value.absent(),
    this.unit = const Value.absent(),
    this.name = const Value.absent(),
  });
  CurrencyTableCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required int scale,
    required String symbol,
    required bool invertSeparators,
    required String pattern,
    required String country,
    required String unit,
    required String name,
  })  : code = Value(code),
        scale = Value(scale),
        symbol = Value(symbol),
        invertSeparators = Value(invertSeparators),
        pattern = Value(pattern),
        country = Value(country),
        unit = Value(unit),
        name = Value(name);
  static Insertable<CurrencyTableData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<int>? scale,
    Expression<String>? symbol,
    Expression<bool>? invertSeparators,
    Expression<String>? pattern,
    Expression<String>? country,
    Expression<String>? unit,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (scale != null) 'scale': scale,
      if (symbol != null) 'symbol': symbol,
      if (invertSeparators != null) 'invert_separators': invertSeparators,
      if (pattern != null) 'pattern': pattern,
      if (country != null) 'country': country,
      if (unit != null) 'unit': unit,
      if (name != null) 'name': name,
    });
  }

  CurrencyTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? code,
      Value<int>? scale,
      Value<String>? symbol,
      Value<bool>? invertSeparators,
      Value<String>? pattern,
      Value<String>? country,
      Value<String>? unit,
      Value<String>? name}) {
    return CurrencyTableCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      scale: scale ?? this.scale,
      symbol: symbol ?? this.symbol,
      invertSeparators: invertSeparators ?? this.invertSeparators,
      pattern: pattern ?? this.pattern,
      country: country ?? this.country,
      unit: unit ?? this.unit,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (scale.present) {
      map['scale'] = Variable<int>(scale.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (invertSeparators.present) {
      map['invert_separators'] = Variable<bool>(invertSeparators.value);
    }
    if (pattern.present) {
      map['pattern'] = Variable<String>(pattern.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyTableCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('scale: $scale, ')
          ..write('symbol: $symbol, ')
          ..write('invertSeparators: $invertSeparators, ')
          ..write('pattern: $pattern, ')
          ..write('country: $country, ')
          ..write('unit: $unit, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TransactionCategoryTable extends TransactionCategory
    with TableInfo<$TransactionCategoryTable, TransactionCategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionCategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentMeta = const VerificationMeta('parent');
  @override
  late final GeneratedColumn<int> parent = GeneratedColumn<int>(
      'parent', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES transaction_category (id) ON UPDATE NO ACTION ON DELETE NO ACTION'));
  static const VerificationMeta _childrenMeta =
      const VerificationMeta('children');
  @override
  late final GeneratedColumn<int> children = GeneratedColumn<int>(
      'children', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES transaction_category (id) ON UPDATE NO ACTION ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, parent, children];
  @override
  String get aliasedName => _alias ?? 'transaction_category';
  @override
  String get actualTableName => 'transaction_category';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransactionCategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('parent')) {
      context.handle(_parentMeta,
          parent.isAcceptableOrUnknown(data['parent']!, _parentMeta));
    }
    if (data.containsKey('children')) {
      context.handle(_childrenMeta,
          children.isAcceptableOrUnknown(data['children']!, _childrenMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionCategoryData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionCategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      parent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent']),
      children: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}children']),
    );
  }

  @override
  $TransactionCategoryTable createAlias(String alias) {
    return $TransactionCategoryTable(attachedDatabase, alias);
  }
}

class TransactionCategoryData extends DataClass
    implements Insertable<TransactionCategoryData> {
  final int id;
  final String name;
  final String description;
  final int? parent;
  final int? children;
  const TransactionCategoryData(
      {required this.id,
      required this.name,
      required this.description,
      this.parent,
      this.children});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || parent != null) {
      map['parent'] = Variable<int>(parent);
    }
    if (!nullToAbsent || children != null) {
      map['children'] = Variable<int>(children);
    }
    return map;
  }

  TransactionCategoryCompanion toCompanion(bool nullToAbsent) {
    return TransactionCategoryCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      parent:
          parent == null && nullToAbsent ? const Value.absent() : Value(parent),
      children: children == null && nullToAbsent
          ? const Value.absent()
          : Value(children),
    );
  }

  factory TransactionCategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionCategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      parent: serializer.fromJson<int?>(json['parent']),
      children: serializer.fromJson<int?>(json['children']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'parent': serializer.toJson<int?>(parent),
      'children': serializer.toJson<int?>(children),
    };
  }

  TransactionCategoryData copyWith(
          {int? id,
          String? name,
          String? description,
          Value<int?> parent = const Value.absent(),
          Value<int?> children = const Value.absent()}) =>
      TransactionCategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        parent: parent.present ? parent.value : this.parent,
        children: children.present ? children.value : this.children,
      );
  @override
  String toString() {
    return (StringBuffer('TransactionCategoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('parent: $parent, ')
          ..write('children: $children')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, parent, children);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionCategoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.parent == this.parent &&
          other.children == this.children);
}

class TransactionCategoryCompanion
    extends UpdateCompanion<TransactionCategoryData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int?> parent;
  final Value<int?> children;
  const TransactionCategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.parent = const Value.absent(),
    this.children = const Value.absent(),
  });
  TransactionCategoryCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.parent = const Value.absent(),
    this.children = const Value.absent(),
  })  : name = Value(name),
        description = Value(description);
  static Insertable<TransactionCategoryData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? parent,
    Expression<int>? children,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (parent != null) 'parent': parent,
      if (children != null) 'children': children,
    });
  }

  TransactionCategoryCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int?>? parent,
      Value<int?>? children}) {
    return TransactionCategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      parent: parent ?? this.parent,
      children: children ?? this.children,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (parent.present) {
      map['parent'] = Variable<int>(parent.value);
    }
    if (children.present) {
      map['children'] = Variable<int>(children.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('parent: $parent, ')
          ..write('children: $children')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDB extends GeneratedDatabase {
  _$LocalDB(QueryExecutor e) : super(e);
  late final $CurrencyTableTable currencyTable = $CurrencyTableTable(this);
  late final $TransactionCategoryTable transactionCategory =
      $TransactionCategoryTable(this);
  late final LocalCurrencyDao localCurrencyDao =
      LocalCurrencyDao(this as LocalDB);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [currencyTable, transactionCategory];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('transaction_category',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('transaction_category', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}
