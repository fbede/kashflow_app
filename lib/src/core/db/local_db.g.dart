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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: _vlsid.nextId);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _decimalDigitsMeta =
      const VerificationMeta('decimalDigits');
  @override
  late final GeneratedColumn<int> decimalDigits = GeneratedColumn<int>(
      'decimal_digits', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _patternMeta =
      const VerificationMeta('pattern');
  @override
  late final GeneratedColumn<String> pattern = GeneratedColumn<String>(
      'pattern', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _groupSeparatorMeta =
      const VerificationMeta('groupSeparator');
  @override
  late final GeneratedColumn<String> groupSeparator = GeneratedColumn<String>(
      'group_separator', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 5),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _decimalSeparatorMeta =
      const VerificationMeta('decimalSeparator');
  @override
  late final GeneratedColumn<String> decimalSeparator = GeneratedColumn<String>(
      'decimal_separator', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 5),
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
  static const VerificationMeta _hasBeenUsedMeta =
      const VerificationMeta('hasBeenUsed');
  @override
  late final GeneratedColumn<bool> hasBeenUsed = GeneratedColumn<bool>(
      'has_been_used', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_been_used" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isDefaultMeta =
      const VerificationMeta('isDefault');
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
      'is_default', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_default" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        code,
        decimalDigits,
        symbol,
        pattern,
        groupSeparator,
        decimalSeparator,
        country,
        unit,
        name,
        hasBeenUsed,
        isDefault
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currency_table';
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
    if (data.containsKey('decimal_digits')) {
      context.handle(
          _decimalDigitsMeta,
          decimalDigits.isAcceptableOrUnknown(
              data['decimal_digits']!, _decimalDigitsMeta));
    } else if (isInserting) {
      context.missing(_decimalDigitsMeta);
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
    if (data.containsKey('group_separator')) {
      context.handle(
          _groupSeparatorMeta,
          groupSeparator.isAcceptableOrUnknown(
              data['group_separator']!, _groupSeparatorMeta));
    } else if (isInserting) {
      context.missing(_groupSeparatorMeta);
    }
    if (data.containsKey('decimal_separator')) {
      context.handle(
          _decimalSeparatorMeta,
          decimalSeparator.isAcceptableOrUnknown(
              data['decimal_separator']!, _decimalSeparatorMeta));
    } else if (isInserting) {
      context.missing(_decimalSeparatorMeta);
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
    if (data.containsKey('has_been_used')) {
      context.handle(
          _hasBeenUsedMeta,
          hasBeenUsed.isAcceptableOrUnknown(
              data['has_been_used']!, _hasBeenUsedMeta));
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta));
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      decimalDigits: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}decimal_digits'])!,
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      pattern: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pattern'])!,
      groupSeparator: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}group_separator'])!,
      decimalSeparator: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}decimal_separator'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      hasBeenUsed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_been_used'])!,
      isDefault: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_default'])!,
    );
  }

  @override
  $CurrencyTableTable createAlias(String alias) {
    return $CurrencyTableTable(attachedDatabase, alias);
  }
}

class CurrencyTableData extends DataClass
    implements Insertable<CurrencyTableData> {
  final String id;
  final String code;
  final int decimalDigits;
  final String symbol;
  final String pattern;
  final String groupSeparator;
  final String decimalSeparator;
  final String country;
  final String unit;
  final String name;
  final bool hasBeenUsed;
  final bool isDefault;
  const CurrencyTableData(
      {required this.id,
      required this.code,
      required this.decimalDigits,
      required this.symbol,
      required this.pattern,
      required this.groupSeparator,
      required this.decimalSeparator,
      required this.country,
      required this.unit,
      required this.name,
      required this.hasBeenUsed,
      required this.isDefault});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['decimal_digits'] = Variable<int>(decimalDigits);
    map['symbol'] = Variable<String>(symbol);
    map['pattern'] = Variable<String>(pattern);
    map['group_separator'] = Variable<String>(groupSeparator);
    map['decimal_separator'] = Variable<String>(decimalSeparator);
    map['country'] = Variable<String>(country);
    map['unit'] = Variable<String>(unit);
    map['name'] = Variable<String>(name);
    map['has_been_used'] = Variable<bool>(hasBeenUsed);
    map['is_default'] = Variable<bool>(isDefault);
    return map;
  }

  CurrencyTableCompanion toCompanion(bool nullToAbsent) {
    return CurrencyTableCompanion(
      id: Value(id),
      code: Value(code),
      decimalDigits: Value(decimalDigits),
      symbol: Value(symbol),
      pattern: Value(pattern),
      groupSeparator: Value(groupSeparator),
      decimalSeparator: Value(decimalSeparator),
      country: Value(country),
      unit: Value(unit),
      name: Value(name),
      hasBeenUsed: Value(hasBeenUsed),
      isDefault: Value(isDefault),
    );
  }

  factory CurrencyTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyTableData(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      decimalDigits: serializer.fromJson<int>(json['decimalDigits']),
      symbol: serializer.fromJson<String>(json['symbol']),
      pattern: serializer.fromJson<String>(json['pattern']),
      groupSeparator: serializer.fromJson<String>(json['groupSeparator']),
      decimalSeparator: serializer.fromJson<String>(json['decimalSeparator']),
      country: serializer.fromJson<String>(json['country']),
      unit: serializer.fromJson<String>(json['unit']),
      name: serializer.fromJson<String>(json['name']),
      hasBeenUsed: serializer.fromJson<bool>(json['hasBeenUsed']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'decimalDigits': serializer.toJson<int>(decimalDigits),
      'symbol': serializer.toJson<String>(symbol),
      'pattern': serializer.toJson<String>(pattern),
      'groupSeparator': serializer.toJson<String>(groupSeparator),
      'decimalSeparator': serializer.toJson<String>(decimalSeparator),
      'country': serializer.toJson<String>(country),
      'unit': serializer.toJson<String>(unit),
      'name': serializer.toJson<String>(name),
      'hasBeenUsed': serializer.toJson<bool>(hasBeenUsed),
      'isDefault': serializer.toJson<bool>(isDefault),
    };
  }

  CurrencyTableData copyWith(
          {String? id,
          String? code,
          int? decimalDigits,
          String? symbol,
          String? pattern,
          String? groupSeparator,
          String? decimalSeparator,
          String? country,
          String? unit,
          String? name,
          bool? hasBeenUsed,
          bool? isDefault}) =>
      CurrencyTableData(
        id: id ?? this.id,
        code: code ?? this.code,
        decimalDigits: decimalDigits ?? this.decimalDigits,
        symbol: symbol ?? this.symbol,
        pattern: pattern ?? this.pattern,
        groupSeparator: groupSeparator ?? this.groupSeparator,
        decimalSeparator: decimalSeparator ?? this.decimalSeparator,
        country: country ?? this.country,
        unit: unit ?? this.unit,
        name: name ?? this.name,
        hasBeenUsed: hasBeenUsed ?? this.hasBeenUsed,
        isDefault: isDefault ?? this.isDefault,
      );
  @override
  String toString() {
    return (StringBuffer('CurrencyTableData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('decimalDigits: $decimalDigits, ')
          ..write('symbol: $symbol, ')
          ..write('pattern: $pattern, ')
          ..write('groupSeparator: $groupSeparator, ')
          ..write('decimalSeparator: $decimalSeparator, ')
          ..write('country: $country, ')
          ..write('unit: $unit, ')
          ..write('name: $name, ')
          ..write('hasBeenUsed: $hasBeenUsed, ')
          ..write('isDefault: $isDefault')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      code,
      decimalDigits,
      symbol,
      pattern,
      groupSeparator,
      decimalSeparator,
      country,
      unit,
      name,
      hasBeenUsed,
      isDefault);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyTableData &&
          other.id == this.id &&
          other.code == this.code &&
          other.decimalDigits == this.decimalDigits &&
          other.symbol == this.symbol &&
          other.pattern == this.pattern &&
          other.groupSeparator == this.groupSeparator &&
          other.decimalSeparator == this.decimalSeparator &&
          other.country == this.country &&
          other.unit == this.unit &&
          other.name == this.name &&
          other.hasBeenUsed == this.hasBeenUsed &&
          other.isDefault == this.isDefault);
}

class CurrencyTableCompanion extends UpdateCompanion<CurrencyTableData> {
  final Value<String> id;
  final Value<String> code;
  final Value<int> decimalDigits;
  final Value<String> symbol;
  final Value<String> pattern;
  final Value<String> groupSeparator;
  final Value<String> decimalSeparator;
  final Value<String> country;
  final Value<String> unit;
  final Value<String> name;
  final Value<bool> hasBeenUsed;
  final Value<bool> isDefault;
  final Value<int> rowid;
  const CurrencyTableCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.decimalDigits = const Value.absent(),
    this.symbol = const Value.absent(),
    this.pattern = const Value.absent(),
    this.groupSeparator = const Value.absent(),
    this.decimalSeparator = const Value.absent(),
    this.country = const Value.absent(),
    this.unit = const Value.absent(),
    this.name = const Value.absent(),
    this.hasBeenUsed = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurrencyTableCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required int decimalDigits,
    required String symbol,
    required String pattern,
    required String groupSeparator,
    required String decimalSeparator,
    required String country,
    required String unit,
    required String name,
    this.hasBeenUsed = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : code = Value(code),
        decimalDigits = Value(decimalDigits),
        symbol = Value(symbol),
        pattern = Value(pattern),
        groupSeparator = Value(groupSeparator),
        decimalSeparator = Value(decimalSeparator),
        country = Value(country),
        unit = Value(unit),
        name = Value(name);
  static Insertable<CurrencyTableData> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<int>? decimalDigits,
    Expression<String>? symbol,
    Expression<String>? pattern,
    Expression<String>? groupSeparator,
    Expression<String>? decimalSeparator,
    Expression<String>? country,
    Expression<String>? unit,
    Expression<String>? name,
    Expression<bool>? hasBeenUsed,
    Expression<bool>? isDefault,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (decimalDigits != null) 'decimal_digits': decimalDigits,
      if (symbol != null) 'symbol': symbol,
      if (pattern != null) 'pattern': pattern,
      if (groupSeparator != null) 'group_separator': groupSeparator,
      if (decimalSeparator != null) 'decimal_separator': decimalSeparator,
      if (country != null) 'country': country,
      if (unit != null) 'unit': unit,
      if (name != null) 'name': name,
      if (hasBeenUsed != null) 'has_been_used': hasBeenUsed,
      if (isDefault != null) 'is_default': isDefault,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurrencyTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? code,
      Value<int>? decimalDigits,
      Value<String>? symbol,
      Value<String>? pattern,
      Value<String>? groupSeparator,
      Value<String>? decimalSeparator,
      Value<String>? country,
      Value<String>? unit,
      Value<String>? name,
      Value<bool>? hasBeenUsed,
      Value<bool>? isDefault,
      Value<int>? rowid}) {
    return CurrencyTableCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      decimalDigits: decimalDigits ?? this.decimalDigits,
      symbol: symbol ?? this.symbol,
      pattern: pattern ?? this.pattern,
      groupSeparator: groupSeparator ?? this.groupSeparator,
      decimalSeparator: decimalSeparator ?? this.decimalSeparator,
      country: country ?? this.country,
      unit: unit ?? this.unit,
      name: name ?? this.name,
      hasBeenUsed: hasBeenUsed ?? this.hasBeenUsed,
      isDefault: isDefault ?? this.isDefault,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (decimalDigits.present) {
      map['decimal_digits'] = Variable<int>(decimalDigits.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (pattern.present) {
      map['pattern'] = Variable<String>(pattern.value);
    }
    if (groupSeparator.present) {
      map['group_separator'] = Variable<String>(groupSeparator.value);
    }
    if (decimalSeparator.present) {
      map['decimal_separator'] = Variable<String>(decimalSeparator.value);
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
    if (hasBeenUsed.present) {
      map['has_been_used'] = Variable<bool>(hasBeenUsed.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyTableCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('decimalDigits: $decimalDigits, ')
          ..write('symbol: $symbol, ')
          ..write('pattern: $pattern, ')
          ..write('groupSeparator: $groupSeparator, ')
          ..write('decimalSeparator: $decimalSeparator, ')
          ..write('country: $country, ')
          ..write('unit: $unit, ')
          ..write('name: $name, ')
          ..write('hasBeenUsed: $hasBeenUsed, ')
          ..write('isDefault: $isDefault, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssetIconTableTable extends AssetIconTable
    with TableInfo<$AssetIconTableTable, AssetIconTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssetIconTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoriesMeta =
      const VerificationMeta('categories');
  @override
  late final GeneratedColumn<String> categories = GeneratedColumn<String>(
      'categories', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [name, tags, categories];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'asset_icon_table';
  @override
  VerificationContext validateIntegrity(Insertable<AssetIconTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    } else if (isInserting) {
      context.missing(_tagsMeta);
    }
    if (data.containsKey('categories')) {
      context.handle(
          _categoriesMeta,
          categories.isAcceptableOrUnknown(
              data['categories']!, _categoriesMeta));
    } else if (isInserting) {
      context.missing(_categoriesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  AssetIconTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssetIconTableData(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!,
      categories: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categories'])!,
    );
  }

  @override
  $AssetIconTableTable createAlias(String alias) {
    return $AssetIconTableTable(attachedDatabase, alias);
  }
}

class AssetIconTableData extends DataClass
    implements Insertable<AssetIconTableData> {
  final String name;
  final String tags;
  final String categories;
  const AssetIconTableData(
      {required this.name, required this.tags, required this.categories});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['tags'] = Variable<String>(tags);
    map['categories'] = Variable<String>(categories);
    return map;
  }

  AssetIconTableCompanion toCompanion(bool nullToAbsent) {
    return AssetIconTableCompanion(
      name: Value(name),
      tags: Value(tags),
      categories: Value(categories),
    );
  }

  factory AssetIconTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssetIconTableData(
      name: serializer.fromJson<String>(json['name']),
      tags: serializer.fromJson<String>(json['tags']),
      categories: serializer.fromJson<String>(json['categories']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'tags': serializer.toJson<String>(tags),
      'categories': serializer.toJson<String>(categories),
    };
  }

  AssetIconTableData copyWith(
          {String? name, String? tags, String? categories}) =>
      AssetIconTableData(
        name: name ?? this.name,
        tags: tags ?? this.tags,
        categories: categories ?? this.categories,
      );
  @override
  String toString() {
    return (StringBuffer('AssetIconTableData(')
          ..write('name: $name, ')
          ..write('tags: $tags, ')
          ..write('categories: $categories')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, tags, categories);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssetIconTableData &&
          other.name == this.name &&
          other.tags == this.tags &&
          other.categories == this.categories);
}

class AssetIconTableCompanion extends UpdateCompanion<AssetIconTableData> {
  final Value<String> name;
  final Value<String> tags;
  final Value<String> categories;
  final Value<int> rowid;
  const AssetIconTableCompanion({
    this.name = const Value.absent(),
    this.tags = const Value.absent(),
    this.categories = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssetIconTableCompanion.insert({
    required String name,
    required String tags,
    required String categories,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        tags = Value(tags),
        categories = Value(categories);
  static Insertable<AssetIconTableData> custom({
    Expression<String>? name,
    Expression<String>? tags,
    Expression<String>? categories,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (categories != null) 'categories': categories,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssetIconTableCompanion copyWith(
      {Value<String>? name,
      Value<String>? tags,
      Value<String>? categories,
      Value<int>? rowid}) {
    return AssetIconTableCompanion(
      name: name ?? this.name,
      tags: tags ?? this.tags,
      categories: categories ?? this.categories,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (categories.present) {
      map['categories'] = Variable<String>(categories.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssetIconTableCompanion(')
          ..write('name: $name, ')
          ..write('tags: $tags, ')
          ..write('categories: $categories, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccountTableTable extends AccountTable
    with TableInfo<$AccountTableTable, AccountTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: _vlsid.nextId);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 25),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES currency_table (id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _openingBalanceMeta =
      const VerificationMeta('openingBalance');
  @override
  late final GeneratedColumn<BigInt> openingBalance = GeneratedColumn<BigInt>(
      'opening_balance', aliasedName, false,
      type: DriftSqlType.bigInt, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES asset_icon_table (name)'));
  static const VerificationMeta _iconColorMeta =
      const VerificationMeta('iconColor');
  @override
  late final GeneratedColumnWithTypeConverter<Color?, int> iconColor =
      GeneratedColumn<int>('icon_color', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<Color?>($AccountTableTable.$convertericonColor);
  static const VerificationMeta _backgroundColorMeta =
      const VerificationMeta('backgroundColor');
  @override
  late final GeneratedColumnWithTypeConverter<Color?, int> backgroundColor =
      GeneratedColumn<int>('background_color', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<Color?>($AccountTableTable.$converterbackgroundColor);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        currency,
        description,
        openingBalance,
        icon,
        iconColor,
        backgroundColor
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_table';
  @override
  VerificationContext validateIntegrity(Insertable<AccountTableData> instance,
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
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
          _openingBalanceMeta,
          openingBalance.isAcceptableOrUnknown(
              data['opening_balance']!, _openingBalanceMeta));
    } else if (isInserting) {
      context.missing(_openingBalanceMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    context.handle(_iconColorMeta, const VerificationResult.success());
    context.handle(_backgroundColorMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      openingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.bigInt, data['${effectivePrefix}opening_balance'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
      iconColor: $AccountTableTable.$convertericonColor.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}icon_color'])),
      backgroundColor: $AccountTableTable.$converterbackgroundColor.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}background_color'])),
    );
  }

  @override
  $AccountTableTable createAlias(String alias) {
    return $AccountTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Color?, int?> $convertericonColor =
      ColorIntTypeConverter();
  static TypeConverter<Color?, int?> $converterbackgroundColor =
      ColorIntTypeConverter();
}

class AccountTableData extends DataClass
    implements Insertable<AccountTableData> {
  final String id;
  final String name;
  final String currency;
  final String description;
  final BigInt openingBalance;
  final String icon;
  final Color? iconColor;
  final Color? backgroundColor;
  const AccountTableData(
      {required this.id,
      required this.name,
      required this.currency,
      required this.description,
      required this.openingBalance,
      required this.icon,
      this.iconColor,
      this.backgroundColor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['currency'] = Variable<String>(currency);
    map['description'] = Variable<String>(description);
    map['opening_balance'] = Variable<BigInt>(openingBalance);
    map['icon'] = Variable<String>(icon);
    if (!nullToAbsent || iconColor != null) {
      map['icon_color'] = Variable<int>(
          $AccountTableTable.$convertericonColor.toSql(iconColor));
    }
    if (!nullToAbsent || backgroundColor != null) {
      map['background_color'] = Variable<int>(
          $AccountTableTable.$converterbackgroundColor.toSql(backgroundColor));
    }
    return map;
  }

  AccountTableCompanion toCompanion(bool nullToAbsent) {
    return AccountTableCompanion(
      id: Value(id),
      name: Value(name),
      currency: Value(currency),
      description: Value(description),
      openingBalance: Value(openingBalance),
      icon: Value(icon),
      iconColor: iconColor == null && nullToAbsent
          ? const Value.absent()
          : Value(iconColor),
      backgroundColor: backgroundColor == null && nullToAbsent
          ? const Value.absent()
          : Value(backgroundColor),
    );
  }

  factory AccountTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      currency: serializer.fromJson<String>(json['currency']),
      description: serializer.fromJson<String>(json['description']),
      openingBalance: serializer.fromJson<BigInt>(json['openingBalance']),
      icon: serializer.fromJson<String>(json['icon']),
      iconColor: serializer.fromJson<Color?>(json['iconColor']),
      backgroundColor: serializer.fromJson<Color?>(json['backgroundColor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'currency': serializer.toJson<String>(currency),
      'description': serializer.toJson<String>(description),
      'openingBalance': serializer.toJson<BigInt>(openingBalance),
      'icon': serializer.toJson<String>(icon),
      'iconColor': serializer.toJson<Color?>(iconColor),
      'backgroundColor': serializer.toJson<Color?>(backgroundColor),
    };
  }

  AccountTableData copyWith(
          {String? id,
          String? name,
          String? currency,
          String? description,
          BigInt? openingBalance,
          String? icon,
          Value<Color?> iconColor = const Value.absent(),
          Value<Color?> backgroundColor = const Value.absent()}) =>
      AccountTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        openingBalance: openingBalance ?? this.openingBalance,
        icon: icon ?? this.icon,
        iconColor: iconColor.present ? iconColor.value : this.iconColor,
        backgroundColor: backgroundColor.present
            ? backgroundColor.value
            : this.backgroundColor,
      );
  @override
  String toString() {
    return (StringBuffer('AccountTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('currency: $currency, ')
          ..write('description: $description, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('icon: $icon, ')
          ..write('iconColor: $iconColor, ')
          ..write('backgroundColor: $backgroundColor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, currency, description,
      openingBalance, icon, iconColor, backgroundColor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.currency == this.currency &&
          other.description == this.description &&
          other.openingBalance == this.openingBalance &&
          other.icon == this.icon &&
          other.iconColor == this.iconColor &&
          other.backgroundColor == this.backgroundColor);
}

class AccountTableCompanion extends UpdateCompanion<AccountTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> currency;
  final Value<String> description;
  final Value<BigInt> openingBalance;
  final Value<String> icon;
  final Value<Color?> iconColor;
  final Value<Color?> backgroundColor;
  final Value<int> rowid;
  const AccountTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.currency = const Value.absent(),
    this.description = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.icon = const Value.absent(),
    this.iconColor = const Value.absent(),
    this.backgroundColor = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String currency,
    required String description,
    required BigInt openingBalance,
    required String icon,
    this.iconColor = const Value.absent(),
    this.backgroundColor = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        currency = Value(currency),
        description = Value(description),
        openingBalance = Value(openingBalance),
        icon = Value(icon);
  static Insertable<AccountTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? currency,
    Expression<String>? description,
    Expression<BigInt>? openingBalance,
    Expression<String>? icon,
    Expression<int>? iconColor,
    Expression<int>? backgroundColor,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (currency != null) 'currency': currency,
      if (description != null) 'description': description,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (icon != null) 'icon': icon,
      if (iconColor != null) 'icon_color': iconColor,
      if (backgroundColor != null) 'background_color': backgroundColor,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? currency,
      Value<String>? description,
      Value<BigInt>? openingBalance,
      Value<String>? icon,
      Value<Color?>? iconColor,
      Value<Color?>? backgroundColor,
      Value<int>? rowid}) {
    return AccountTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      openingBalance: openingBalance ?? this.openingBalance,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<BigInt>(openingBalance.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (iconColor.present) {
      map['icon_color'] = Variable<int>(
          $AccountTableTable.$convertericonColor.toSql(iconColor.value));
    }
    if (backgroundColor.present) {
      map['background_color'] = Variable<int>($AccountTableTable
          .$converterbackgroundColor
          .toSql(backgroundColor.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('currency: $currency, ')
          ..write('description: $description, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('icon: $icon, ')
          ..write('iconColor: $iconColor, ')
          ..write('backgroundColor: $backgroundColor, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDB extends GeneratedDatabase {
  _$LocalDB(QueryExecutor e) : super(e);
  _$LocalDBManager get managers => _$LocalDBManager(this);
  late final $CurrencyTableTable currencyTable = $CurrencyTableTable(this);
  late final $AssetIconTableTable assetIconTable = $AssetIconTableTable(this);
  late final $AccountTableTable accountTable = $AccountTableTable(this);
  late final CurrencyDao currencyDao = CurrencyDao(this as LocalDB);
  late final AccountDao accountDao = AccountDao(this as LocalDB);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [currencyTable, assetIconTable, accountTable];
}

typedef $$CurrencyTableTableInsertCompanionBuilder = CurrencyTableCompanion
    Function({
  Value<String> id,
  required String code,
  required int decimalDigits,
  required String symbol,
  required String pattern,
  required String groupSeparator,
  required String decimalSeparator,
  required String country,
  required String unit,
  required String name,
  Value<bool> hasBeenUsed,
  Value<bool> isDefault,
  Value<int> rowid,
});
typedef $$CurrencyTableTableUpdateCompanionBuilder = CurrencyTableCompanion
    Function({
  Value<String> id,
  Value<String> code,
  Value<int> decimalDigits,
  Value<String> symbol,
  Value<String> pattern,
  Value<String> groupSeparator,
  Value<String> decimalSeparator,
  Value<String> country,
  Value<String> unit,
  Value<String> name,
  Value<bool> hasBeenUsed,
  Value<bool> isDefault,
  Value<int> rowid,
});

class $$CurrencyTableTableTableManager extends RootTableManager<
    _$LocalDB,
    $CurrencyTableTable,
    CurrencyTableData,
    $$CurrencyTableTableFilterComposer,
    $$CurrencyTableTableOrderingComposer,
    $$CurrencyTableTableProcessedTableManager,
    $$CurrencyTableTableInsertCompanionBuilder,
    $$CurrencyTableTableUpdateCompanionBuilder> {
  $$CurrencyTableTableTableManager(_$LocalDB db, $CurrencyTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CurrencyTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CurrencyTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$CurrencyTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<int> decimalDigits = const Value.absent(),
            Value<String> symbol = const Value.absent(),
            Value<String> pattern = const Value.absent(),
            Value<String> groupSeparator = const Value.absent(),
            Value<String> decimalSeparator = const Value.absent(),
            Value<String> country = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> hasBeenUsed = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CurrencyTableCompanion(
            id: id,
            code: code,
            decimalDigits: decimalDigits,
            symbol: symbol,
            pattern: pattern,
            groupSeparator: groupSeparator,
            decimalSeparator: decimalSeparator,
            country: country,
            unit: unit,
            name: name,
            hasBeenUsed: hasBeenUsed,
            isDefault: isDefault,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            required String code,
            required int decimalDigits,
            required String symbol,
            required String pattern,
            required String groupSeparator,
            required String decimalSeparator,
            required String country,
            required String unit,
            required String name,
            Value<bool> hasBeenUsed = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CurrencyTableCompanion.insert(
            id: id,
            code: code,
            decimalDigits: decimalDigits,
            symbol: symbol,
            pattern: pattern,
            groupSeparator: groupSeparator,
            decimalSeparator: decimalSeparator,
            country: country,
            unit: unit,
            name: name,
            hasBeenUsed: hasBeenUsed,
            isDefault: isDefault,
            rowid: rowid,
          ),
        ));
}

class $$CurrencyTableTableProcessedTableManager extends ProcessedTableManager<
    _$LocalDB,
    $CurrencyTableTable,
    CurrencyTableData,
    $$CurrencyTableTableFilterComposer,
    $$CurrencyTableTableOrderingComposer,
    $$CurrencyTableTableProcessedTableManager,
    $$CurrencyTableTableInsertCompanionBuilder,
    $$CurrencyTableTableUpdateCompanionBuilder> {
  $$CurrencyTableTableProcessedTableManager(super.$state);
}

class $$CurrencyTableTableFilterComposer
    extends FilterComposer<_$LocalDB, $CurrencyTableTable> {
  $$CurrencyTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get code => $state.composableBuilder(
      column: $state.table.code,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get decimalDigits => $state.composableBuilder(
      column: $state.table.decimalDigits,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get pattern => $state.composableBuilder(
      column: $state.table.pattern,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get groupSeparator => $state.composableBuilder(
      column: $state.table.groupSeparator,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get decimalSeparator => $state.composableBuilder(
      column: $state.table.decimalSeparator,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get country => $state.composableBuilder(
      column: $state.table.country,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get unit => $state.composableBuilder(
      column: $state.table.unit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get hasBeenUsed => $state.composableBuilder(
      column: $state.table.hasBeenUsed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDefault => $state.composableBuilder(
      column: $state.table.isDefault,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter accountTableRefs(
      ComposableFilter Function($$AccountTableTableFilterComposer f) f) {
    final $$AccountTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.accountTable,
        getReferencedColumn: (t) => t.currency,
        builder: (joinBuilder, parentComposers) =>
            $$AccountTableTableFilterComposer(ComposerState($state.db,
                $state.db.accountTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$CurrencyTableTableOrderingComposer
    extends OrderingComposer<_$LocalDB, $CurrencyTableTable> {
  $$CurrencyTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get code => $state.composableBuilder(
      column: $state.table.code,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get decimalDigits => $state.composableBuilder(
      column: $state.table.decimalDigits,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get pattern => $state.composableBuilder(
      column: $state.table.pattern,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get groupSeparator => $state.composableBuilder(
      column: $state.table.groupSeparator,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get decimalSeparator => $state.composableBuilder(
      column: $state.table.decimalSeparator,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get country => $state.composableBuilder(
      column: $state.table.country,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get unit => $state.composableBuilder(
      column: $state.table.unit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get hasBeenUsed => $state.composableBuilder(
      column: $state.table.hasBeenUsed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDefault => $state.composableBuilder(
      column: $state.table.isDefault,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AssetIconTableTableInsertCompanionBuilder = AssetIconTableCompanion
    Function({
  required String name,
  required String tags,
  required String categories,
  Value<int> rowid,
});
typedef $$AssetIconTableTableUpdateCompanionBuilder = AssetIconTableCompanion
    Function({
  Value<String> name,
  Value<String> tags,
  Value<String> categories,
  Value<int> rowid,
});

class $$AssetIconTableTableTableManager extends RootTableManager<
    _$LocalDB,
    $AssetIconTableTable,
    AssetIconTableData,
    $$AssetIconTableTableFilterComposer,
    $$AssetIconTableTableOrderingComposer,
    $$AssetIconTableTableProcessedTableManager,
    $$AssetIconTableTableInsertCompanionBuilder,
    $$AssetIconTableTableUpdateCompanionBuilder> {
  $$AssetIconTableTableTableManager(_$LocalDB db, $AssetIconTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AssetIconTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AssetIconTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$AssetIconTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> name = const Value.absent(),
            Value<String> tags = const Value.absent(),
            Value<String> categories = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetIconTableCompanion(
            name: name,
            tags: tags,
            categories: categories,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String name,
            required String tags,
            required String categories,
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetIconTableCompanion.insert(
            name: name,
            tags: tags,
            categories: categories,
            rowid: rowid,
          ),
        ));
}

class $$AssetIconTableTableProcessedTableManager extends ProcessedTableManager<
    _$LocalDB,
    $AssetIconTableTable,
    AssetIconTableData,
    $$AssetIconTableTableFilterComposer,
    $$AssetIconTableTableOrderingComposer,
    $$AssetIconTableTableProcessedTableManager,
    $$AssetIconTableTableInsertCompanionBuilder,
    $$AssetIconTableTableUpdateCompanionBuilder> {
  $$AssetIconTableTableProcessedTableManager(super.$state);
}

class $$AssetIconTableTableFilterComposer
    extends FilterComposer<_$LocalDB, $AssetIconTableTable> {
  $$AssetIconTableTableFilterComposer(super.$state);
  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get categories => $state.composableBuilder(
      column: $state.table.categories,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter accountTableRefs(
      ComposableFilter Function($$AccountTableTableFilterComposer f) f) {
    final $$AccountTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.name,
        referencedTable: $state.db.accountTable,
        getReferencedColumn: (t) => t.icon,
        builder: (joinBuilder, parentComposers) =>
            $$AccountTableTableFilterComposer(ComposerState($state.db,
                $state.db.accountTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$AssetIconTableTableOrderingComposer
    extends OrderingComposer<_$LocalDB, $AssetIconTableTable> {
  $$AssetIconTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get categories => $state.composableBuilder(
      column: $state.table.categories,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AccountTableTableInsertCompanionBuilder = AccountTableCompanion
    Function({
  Value<String> id,
  required String name,
  required String currency,
  required String description,
  required BigInt openingBalance,
  required String icon,
  Value<Color?> iconColor,
  Value<Color?> backgroundColor,
  Value<int> rowid,
});
typedef $$AccountTableTableUpdateCompanionBuilder = AccountTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> currency,
  Value<String> description,
  Value<BigInt> openingBalance,
  Value<String> icon,
  Value<Color?> iconColor,
  Value<Color?> backgroundColor,
  Value<int> rowid,
});

class $$AccountTableTableTableManager extends RootTableManager<
    _$LocalDB,
    $AccountTableTable,
    AccountTableData,
    $$AccountTableTableFilterComposer,
    $$AccountTableTableOrderingComposer,
    $$AccountTableTableProcessedTableManager,
    $$AccountTableTableInsertCompanionBuilder,
    $$AccountTableTableUpdateCompanionBuilder> {
  $$AccountTableTableTableManager(_$LocalDB db, $AccountTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AccountTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AccountTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$AccountTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<BigInt> openingBalance = const Value.absent(),
            Value<String> icon = const Value.absent(),
            Value<Color?> iconColor = const Value.absent(),
            Value<Color?> backgroundColor = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountTableCompanion(
            id: id,
            name: name,
            currency: currency,
            description: description,
            openingBalance: openingBalance,
            icon: icon,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            required String name,
            required String currency,
            required String description,
            required BigInt openingBalance,
            required String icon,
            Value<Color?> iconColor = const Value.absent(),
            Value<Color?> backgroundColor = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountTableCompanion.insert(
            id: id,
            name: name,
            currency: currency,
            description: description,
            openingBalance: openingBalance,
            icon: icon,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            rowid: rowid,
          ),
        ));
}

class $$AccountTableTableProcessedTableManager extends ProcessedTableManager<
    _$LocalDB,
    $AccountTableTable,
    AccountTableData,
    $$AccountTableTableFilterComposer,
    $$AccountTableTableOrderingComposer,
    $$AccountTableTableProcessedTableManager,
    $$AccountTableTableInsertCompanionBuilder,
    $$AccountTableTableUpdateCompanionBuilder> {
  $$AccountTableTableProcessedTableManager(super.$state);
}

class $$AccountTableTableFilterComposer
    extends FilterComposer<_$LocalDB, $AccountTableTable> {
  $$AccountTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<BigInt> get openingBalance => $state.composableBuilder(
      column: $state.table.openingBalance,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Color?, Color, int> get iconColor =>
      $state.composableBuilder(
          column: $state.table.iconColor,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Color?, Color, int> get backgroundColor =>
      $state.composableBuilder(
          column: $state.table.backgroundColor,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  $$CurrencyTableTableFilterComposer get currency {
    final $$CurrencyTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currency,
        referencedTable: $state.db.currencyTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CurrencyTableTableFilterComposer(ComposerState($state.db,
                $state.db.currencyTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$AssetIconTableTableFilterComposer get icon {
    final $$AssetIconTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.icon,
        referencedTable: $state.db.assetIconTable,
        getReferencedColumn: (t) => t.name,
        builder: (joinBuilder, parentComposers) =>
            $$AssetIconTableTableFilterComposer(ComposerState($state.db,
                $state.db.assetIconTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$AccountTableTableOrderingComposer
    extends OrderingComposer<_$LocalDB, $AccountTableTable> {
  $$AccountTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<BigInt> get openingBalance => $state.composableBuilder(
      column: $state.table.openingBalance,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get iconColor => $state.composableBuilder(
      column: $state.table.iconColor,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get backgroundColor => $state.composableBuilder(
      column: $state.table.backgroundColor,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$CurrencyTableTableOrderingComposer get currency {
    final $$CurrencyTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.currency,
            referencedTable: $state.db.currencyTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$CurrencyTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.currencyTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$AssetIconTableTableOrderingComposer get icon {
    final $$AssetIconTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.icon,
            referencedTable: $state.db.assetIconTable,
            getReferencedColumn: (t) => t.name,
            builder: (joinBuilder, parentComposers) =>
                $$AssetIconTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.assetIconTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$LocalDBManager {
  final _$LocalDB _db;
  _$LocalDBManager(this._db);
  $$CurrencyTableTableTableManager get currencyTable =>
      $$CurrencyTableTableTableManager(_db, _db.currencyTable);
  $$AssetIconTableTableTableManager get assetIconTable =>
      $$AssetIconTableTableTableManager(_db, _db.assetIconTable);
  $$AccountTableTableTableManager get accountTable =>
      $$AccountTableTableTableManager(_db, _db.accountTable);
}
