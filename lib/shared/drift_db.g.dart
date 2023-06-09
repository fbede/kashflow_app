// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

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
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(4));
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
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("invert_separators" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _patternMeta =
      const VerificationMeta('pattern');
  @override
  late final GeneratedColumn<String> pattern =
      GeneratedColumn<String>('pattern', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 2,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('S0.00'));
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
  static const VerificationMeta _lastModifiedByServerMeta =
      const VerificationMeta('lastModifiedByServer');
  @override
  late final GeneratedColumn<bool> lastModifiedByServer =
      GeneratedColumn<bool>('last_modified_by_server', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("last_modified_by_server" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _lastModifiedMeta =
      const VerificationMeta('lastModified');
  @override
  late final GeneratedColumn<DateTime> lastModified = GeneratedColumn<DateTime>(
      'last_modified', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        code,
        scale,
        symbol,
        invertSeparators,
        pattern,
        country,
        unit,
        name,
        lastModifiedByServer,
        lastModified
      ];
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
    }
    if (data.containsKey('pattern')) {
      context.handle(_patternMeta,
          pattern.isAcceptableOrUnknown(data['pattern']!, _patternMeta));
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
    if (data.containsKey('last_modified_by_server')) {
      context.handle(
          _lastModifiedByServerMeta,
          lastModifiedByServer.isAcceptableOrUnknown(
              data['last_modified_by_server']!, _lastModifiedByServerMeta));
    }
    if (data.containsKey('last_modified')) {
      context.handle(
          _lastModifiedMeta,
          lastModified.isAcceptableOrUnknown(
              data['last_modified']!, _lastModifiedMeta));
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
      lastModifiedByServer: attachedDatabase.typeMapping.read(DriftSqlType.bool,
          data['${effectivePrefix}last_modified_by_server'])!,
      lastModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_modified'])!,
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
  final bool lastModifiedByServer;
  final DateTime lastModified;
  const CurrencyTableData(
      {required this.id,
      required this.code,
      required this.scale,
      required this.symbol,
      required this.invertSeparators,
      required this.pattern,
      required this.country,
      required this.unit,
      required this.name,
      required this.lastModifiedByServer,
      required this.lastModified});
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
    map['last_modified_by_server'] = Variable<bool>(lastModifiedByServer);
    map['last_modified'] = Variable<DateTime>(lastModified);
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
      lastModifiedByServer: Value(lastModifiedByServer),
      lastModified: Value(lastModified),
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
      lastModifiedByServer:
          serializer.fromJson<bool>(json['lastModifiedByServer']),
      lastModified: serializer.fromJson<DateTime>(json['lastModified']),
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
      'lastModifiedByServer': serializer.toJson<bool>(lastModifiedByServer),
      'lastModified': serializer.toJson<DateTime>(lastModified),
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
          String? name,
          bool? lastModifiedByServer,
          DateTime? lastModified}) =>
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
        lastModifiedByServer: lastModifiedByServer ?? this.lastModifiedByServer,
        lastModified: lastModified ?? this.lastModified,
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
          ..write('name: $name, ')
          ..write('lastModifiedByServer: $lastModifiedByServer, ')
          ..write('lastModified: $lastModified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, scale, symbol, invertSeparators,
      pattern, country, unit, name, lastModifiedByServer, lastModified);
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
          other.name == this.name &&
          other.lastModifiedByServer == this.lastModifiedByServer &&
          other.lastModified == this.lastModified);
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
  final Value<bool> lastModifiedByServer;
  final Value<DateTime> lastModified;
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
    this.lastModifiedByServer = const Value.absent(),
    this.lastModified = const Value.absent(),
  });
  CurrencyTableCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    this.scale = const Value.absent(),
    required String symbol,
    this.invertSeparators = const Value.absent(),
    this.pattern = const Value.absent(),
    required String country,
    required String unit,
    required String name,
    this.lastModifiedByServer = const Value.absent(),
    this.lastModified = const Value.absent(),
  })  : code = Value(code),
        symbol = Value(symbol),
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
    Expression<bool>? lastModifiedByServer,
    Expression<DateTime>? lastModified,
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
      if (lastModifiedByServer != null)
        'last_modified_by_server': lastModifiedByServer,
      if (lastModified != null) 'last_modified': lastModified,
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
      Value<String>? name,
      Value<bool>? lastModifiedByServer,
      Value<DateTime>? lastModified}) {
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
      lastModifiedByServer: lastModifiedByServer ?? this.lastModifiedByServer,
      lastModified: lastModified ?? this.lastModified,
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
    if (lastModifiedByServer.present) {
      map['last_modified_by_server'] =
          Variable<bool>(lastModifiedByServer.value);
    }
    if (lastModified.present) {
      map['last_modified'] = Variable<DateTime>(lastModified.value);
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
          ..write('name: $name, ')
          ..write('lastModifiedByServer: $lastModifiedByServer, ')
          ..write('lastModified: $lastModified')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDB extends GeneratedDatabase {
  _$LocalDB(QueryExecutor e) : super(e);
  late final $CurrencyTableTable currencyTable = $CurrencyTableTable(this);
  late final LocalCurrencyDao localCurrencyDao =
      LocalCurrencyDao(this as LocalDB);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [currencyTable];
}
