// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

// ignore_for_file: type=lint
class $DBCurrencyTable extends DBCurrency
    with TableInfo<$DBCurrencyTable, DBCurrencyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBCurrencyTable(this.attachedDatabase, [this._alias]);
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
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 6),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
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
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDefaultMeta =
      const VerificationMeta('isDefault');
  @override
  late final GeneratedColumn<bool> isDefault =
      GeneratedColumn<bool>('is_default', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_default" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _lastModifiedByServerMeta =
      const VerificationMeta('lastModifiedByServer');
  @override
  late final GeneratedColumn<bool> lastModifiedByServer =
      GeneratedColumn<bool>('last_modified_by_server', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("last_modified_by_server" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        code,
        scale,
        symbol,
        pattern,
        invertSeparators,
        country,
        unit,
        name,
        isDefault,
        lastModifiedByServer
      ];
  @override
  String get aliasedName => _alias ?? 'd_b_currency';
  @override
  String get actualTableName => 'd_b_currency';
  @override
  VerificationContext validateIntegrity(Insertable<DBCurrencyData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    if (data.containsKey('pattern')) {
      context.handle(_patternMeta,
          pattern.isAcceptableOrUnknown(data['pattern']!, _patternMeta));
    } else if (isInserting) {
      context.missing(_patternMeta);
    }
    if (data.containsKey('invert_separators')) {
      context.handle(
          _invertSeparatorsMeta,
          invertSeparators.isAcceptableOrUnknown(
              data['invert_separators']!, _invertSeparatorsMeta));
    } else if (isInserting) {
      context.missing(_invertSeparatorsMeta);
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta));
    } else if (isInserting) {
      context.missing(_isDefaultMeta);
    }
    if (data.containsKey('last_modified_by_server')) {
      context.handle(
          _lastModifiedByServerMeta,
          lastModifiedByServer.isAcceptableOrUnknown(
              data['last_modified_by_server']!, _lastModifiedByServerMeta));
    } else if (isInserting) {
      context.missing(_lastModifiedByServerMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  DBCurrencyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DBCurrencyData(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      scale: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}scale'])!,
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      pattern: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pattern'])!,
      invertSeparators: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}invert_separators'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country']),
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      isDefault: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_default'])!,
      lastModifiedByServer: attachedDatabase.typeMapping.read(DriftSqlType.bool,
          data['${effectivePrefix}last_modified_by_server'])!,
    );
  }

  @override
  $DBCurrencyTable createAlias(String alias) {
    return $DBCurrencyTable(attachedDatabase, alias);
  }
}

class DBCurrencyData extends DataClass implements Insertable<DBCurrencyData> {
  final String code;
  final int scale;
  final String symbol;
  final String pattern;
  final bool invertSeparators;
  final String? country;
  final String? unit;
  final String? name;
  final bool isDefault;
  final bool lastModifiedByServer;
  const DBCurrencyData(
      {required this.code,
      required this.scale,
      required this.symbol,
      required this.pattern,
      required this.invertSeparators,
      this.country,
      this.unit,
      this.name,
      required this.isDefault,
      required this.lastModifiedByServer});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['scale'] = Variable<int>(scale);
    map['symbol'] = Variable<String>(symbol);
    map['pattern'] = Variable<String>(pattern);
    map['invert_separators'] = Variable<bool>(invertSeparators);
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['is_default'] = Variable<bool>(isDefault);
    map['last_modified_by_server'] = Variable<bool>(lastModifiedByServer);
    return map;
  }

  DBCurrencyCompanion toCompanion(bool nullToAbsent) {
    return DBCurrencyCompanion(
      code: Value(code),
      scale: Value(scale),
      symbol: Value(symbol),
      pattern: Value(pattern),
      invertSeparators: Value(invertSeparators),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      isDefault: Value(isDefault),
      lastModifiedByServer: Value(lastModifiedByServer),
    );
  }

  factory DBCurrencyData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DBCurrencyData(
      code: serializer.fromJson<String>(json['code']),
      scale: serializer.fromJson<int>(json['scale']),
      symbol: serializer.fromJson<String>(json['symbol']),
      pattern: serializer.fromJson<String>(json['pattern']),
      invertSeparators: serializer.fromJson<bool>(json['invertSeparators']),
      country: serializer.fromJson<String?>(json['country']),
      unit: serializer.fromJson<String?>(json['unit']),
      name: serializer.fromJson<String?>(json['name']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      lastModifiedByServer:
          serializer.fromJson<bool>(json['lastModifiedByServer']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'scale': serializer.toJson<int>(scale),
      'symbol': serializer.toJson<String>(symbol),
      'pattern': serializer.toJson<String>(pattern),
      'invertSeparators': serializer.toJson<bool>(invertSeparators),
      'country': serializer.toJson<String?>(country),
      'unit': serializer.toJson<String?>(unit),
      'name': serializer.toJson<String?>(name),
      'isDefault': serializer.toJson<bool>(isDefault),
      'lastModifiedByServer': serializer.toJson<bool>(lastModifiedByServer),
    };
  }

  DBCurrencyData copyWith(
          {String? code,
          int? scale,
          String? symbol,
          String? pattern,
          bool? invertSeparators,
          Value<String?> country = const Value.absent(),
          Value<String?> unit = const Value.absent(),
          Value<String?> name = const Value.absent(),
          bool? isDefault,
          bool? lastModifiedByServer}) =>
      DBCurrencyData(
        code: code ?? this.code,
        scale: scale ?? this.scale,
        symbol: symbol ?? this.symbol,
        pattern: pattern ?? this.pattern,
        invertSeparators: invertSeparators ?? this.invertSeparators,
        country: country.present ? country.value : this.country,
        unit: unit.present ? unit.value : this.unit,
        name: name.present ? name.value : this.name,
        isDefault: isDefault ?? this.isDefault,
        lastModifiedByServer: lastModifiedByServer ?? this.lastModifiedByServer,
      );
  @override
  String toString() {
    return (StringBuffer('DBCurrencyData(')
          ..write('code: $code, ')
          ..write('scale: $scale, ')
          ..write('symbol: $symbol, ')
          ..write('pattern: $pattern, ')
          ..write('invertSeparators: $invertSeparators, ')
          ..write('country: $country, ')
          ..write('unit: $unit, ')
          ..write('name: $name, ')
          ..write('isDefault: $isDefault, ')
          ..write('lastModifiedByServer: $lastModifiedByServer')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, scale, symbol, pattern,
      invertSeparators, country, unit, name, isDefault, lastModifiedByServer);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBCurrencyData &&
          other.code == this.code &&
          other.scale == this.scale &&
          other.symbol == this.symbol &&
          other.pattern == this.pattern &&
          other.invertSeparators == this.invertSeparators &&
          other.country == this.country &&
          other.unit == this.unit &&
          other.name == this.name &&
          other.isDefault == this.isDefault &&
          other.lastModifiedByServer == this.lastModifiedByServer);
}

class DBCurrencyCompanion extends UpdateCompanion<DBCurrencyData> {
  final Value<String> code;
  final Value<int> scale;
  final Value<String> symbol;
  final Value<String> pattern;
  final Value<bool> invertSeparators;
  final Value<String?> country;
  final Value<String?> unit;
  final Value<String?> name;
  final Value<bool> isDefault;
  final Value<bool> lastModifiedByServer;
  final Value<int> rowid;
  const DBCurrencyCompanion({
    this.code = const Value.absent(),
    this.scale = const Value.absent(),
    this.symbol = const Value.absent(),
    this.pattern = const Value.absent(),
    this.invertSeparators = const Value.absent(),
    this.country = const Value.absent(),
    this.unit = const Value.absent(),
    this.name = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.lastModifiedByServer = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DBCurrencyCompanion.insert({
    required String code,
    required int scale,
    required String symbol,
    required String pattern,
    required bool invertSeparators,
    this.country = const Value.absent(),
    this.unit = const Value.absent(),
    this.name = const Value.absent(),
    required bool isDefault,
    required bool lastModifiedByServer,
    this.rowid = const Value.absent(),
  })  : code = Value(code),
        scale = Value(scale),
        symbol = Value(symbol),
        pattern = Value(pattern),
        invertSeparators = Value(invertSeparators),
        isDefault = Value(isDefault),
        lastModifiedByServer = Value(lastModifiedByServer);
  static Insertable<DBCurrencyData> custom({
    Expression<String>? code,
    Expression<int>? scale,
    Expression<String>? symbol,
    Expression<String>? pattern,
    Expression<bool>? invertSeparators,
    Expression<String>? country,
    Expression<String>? unit,
    Expression<String>? name,
    Expression<bool>? isDefault,
    Expression<bool>? lastModifiedByServer,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (scale != null) 'scale': scale,
      if (symbol != null) 'symbol': symbol,
      if (pattern != null) 'pattern': pattern,
      if (invertSeparators != null) 'invert_separators': invertSeparators,
      if (country != null) 'country': country,
      if (unit != null) 'unit': unit,
      if (name != null) 'name': name,
      if (isDefault != null) 'is_default': isDefault,
      if (lastModifiedByServer != null)
        'last_modified_by_server': lastModifiedByServer,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DBCurrencyCompanion copyWith(
      {Value<String>? code,
      Value<int>? scale,
      Value<String>? symbol,
      Value<String>? pattern,
      Value<bool>? invertSeparators,
      Value<String?>? country,
      Value<String?>? unit,
      Value<String?>? name,
      Value<bool>? isDefault,
      Value<bool>? lastModifiedByServer,
      Value<int>? rowid}) {
    return DBCurrencyCompanion(
      code: code ?? this.code,
      scale: scale ?? this.scale,
      symbol: symbol ?? this.symbol,
      pattern: pattern ?? this.pattern,
      invertSeparators: invertSeparators ?? this.invertSeparators,
      country: country ?? this.country,
      unit: unit ?? this.unit,
      name: name ?? this.name,
      isDefault: isDefault ?? this.isDefault,
      lastModifiedByServer: lastModifiedByServer ?? this.lastModifiedByServer,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (scale.present) {
      map['scale'] = Variable<int>(scale.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (pattern.present) {
      map['pattern'] = Variable<String>(pattern.value);
    }
    if (invertSeparators.present) {
      map['invert_separators'] = Variable<bool>(invertSeparators.value);
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
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (lastModifiedByServer.present) {
      map['last_modified_by_server'] =
          Variable<bool>(lastModifiedByServer.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBCurrencyCompanion(')
          ..write('code: $code, ')
          ..write('scale: $scale, ')
          ..write('symbol: $symbol, ')
          ..write('pattern: $pattern, ')
          ..write('invertSeparators: $invertSeparators, ')
          ..write('country: $country, ')
          ..write('unit: $unit, ')
          ..write('name: $name, ')
          ..write('isDefault: $isDefault, ')
          ..write('lastModifiedByServer: $lastModifiedByServer, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftDB extends GeneratedDatabase {
  _$DriftDB(QueryExecutor e) : super(e);
  late final $DBCurrencyTable dBCurrency = $DBCurrencyTable(this);
  late final CurrencyDao currencyDao = CurrencyDao(this as DriftDB);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dBCurrency];
}
