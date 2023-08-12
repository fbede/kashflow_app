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
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
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
  late final GeneratedColumn<bool> invertSeparators = GeneratedColumn<bool>(
      'invert_separators', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("invert_separators" IN (0, 1))'));
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

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
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
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 25),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES currency_table (id)'));
  static const VerificationMeta _openingBalanceMeta =
      const VerificationMeta('openingBalance');
  @override
  late final GeneratedColumn<BigInt> openingBalance = GeneratedColumn<BigInt>(
      'opening_balance', aliasedName, false,
      type: DriftSqlType.bigInt, requiredDuringInsert: true);
  static const VerificationMeta _closingBalanceMeta =
      const VerificationMeta('closingBalance');
  @override
  late final GeneratedColumn<BigInt> closingBalance = GeneratedColumn<BigInt>(
      'closing_balance', aliasedName, true,
      type: DriftSqlType.bigInt, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _iconCodePointMeta =
      const VerificationMeta('iconCodePoint');
  @override
  late final GeneratedColumn<int> iconCodePoint = GeneratedColumn<int>(
      'icon_code_point', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _iconFontFamilyMeta =
      const VerificationMeta('iconFontFamily');
  @override
  late final GeneratedColumn<String> iconFontFamily = GeneratedColumn<String>(
      'icon_font_family', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _iconFontPackageMeta =
      const VerificationMeta('iconFontPackage');
  @override
  late final GeneratedColumn<String> iconFontPackage = GeneratedColumn<String>(
      'icon_font_package', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _iconMatchesTextDirectionMeta =
      const VerificationMeta('iconMatchesTextDirection');
  @override
  late final GeneratedColumn<bool> iconMatchesTextDirection =
      GeneratedColumn<bool>(
          'icon_matches_text_direction', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("icon_matches_text_direction" IN (0, 1))'));
  static const VerificationMeta _iconColorValueMeta =
      const VerificationMeta('iconColorValue');
  @override
  late final GeneratedColumn<int> iconColorValue = GeneratedColumn<int>(
      'icon_color_value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _backgroundColorValueMeta =
      const VerificationMeta('backgroundColorValue');
  @override
  late final GeneratedColumn<int> backgroundColorValue = GeneratedColumn<int>(
      'background_color_value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        currency,
        openingBalance,
        closingBalance,
        description,
        iconCodePoint,
        iconFontFamily,
        iconFontPackage,
        iconMatchesTextDirection,
        iconColorValue,
        backgroundColorValue
      ];
  @override
  String get aliasedName => _alias ?? 'accounts';
  @override
  String get actualTableName => 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
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
    if (data.containsKey('opening_balance')) {
      context.handle(
          _openingBalanceMeta,
          openingBalance.isAcceptableOrUnknown(
              data['opening_balance']!, _openingBalanceMeta));
    } else if (isInserting) {
      context.missing(_openingBalanceMeta);
    }
    if (data.containsKey('closing_balance')) {
      context.handle(
          _closingBalanceMeta,
          closingBalance.isAcceptableOrUnknown(
              data['closing_balance']!, _closingBalanceMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('icon_code_point')) {
      context.handle(
          _iconCodePointMeta,
          iconCodePoint.isAcceptableOrUnknown(
              data['icon_code_point']!, _iconCodePointMeta));
    } else if (isInserting) {
      context.missing(_iconCodePointMeta);
    }
    if (data.containsKey('icon_font_family')) {
      context.handle(
          _iconFontFamilyMeta,
          iconFontFamily.isAcceptableOrUnknown(
              data['icon_font_family']!, _iconFontFamilyMeta));
    }
    if (data.containsKey('icon_font_package')) {
      context.handle(
          _iconFontPackageMeta,
          iconFontPackage.isAcceptableOrUnknown(
              data['icon_font_package']!, _iconFontPackageMeta));
    }
    if (data.containsKey('icon_matches_text_direction')) {
      context.handle(
          _iconMatchesTextDirectionMeta,
          iconMatchesTextDirection.isAcceptableOrUnknown(
              data['icon_matches_text_direction']!,
              _iconMatchesTextDirectionMeta));
    } else if (isInserting) {
      context.missing(_iconMatchesTextDirectionMeta);
    }
    if (data.containsKey('icon_color_value')) {
      context.handle(
          _iconColorValueMeta,
          iconColorValue.isAcceptableOrUnknown(
              data['icon_color_value']!, _iconColorValueMeta));
    } else if (isInserting) {
      context.missing(_iconColorValueMeta);
    }
    if (data.containsKey('background_color_value')) {
      context.handle(
          _backgroundColorValueMeta,
          backgroundColorValue.isAcceptableOrUnknown(
              data['background_color_value']!, _backgroundColorValueMeta));
    } else if (isInserting) {
      context.missing(_backgroundColorValueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      openingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.bigInt, data['${effectivePrefix}opening_balance'])!,
      closingBalance: attachedDatabase.typeMapping
          .read(DriftSqlType.bigInt, data['${effectivePrefix}closing_balance']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      iconCodePoint: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}icon_code_point'])!,
      iconFontFamily: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}icon_font_family']),
      iconFontPackage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}icon_font_package']),
      iconMatchesTextDirection: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}icon_matches_text_direction'])!,
      iconColorValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}icon_color_value'])!,
      backgroundColorValue: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}background_color_value'])!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class Account extends DataClass implements Insertable<Account> {
  final int id;
  final String name;
  final String currency;
  final BigInt openingBalance;
  final BigInt? closingBalance;
  final String description;
  final int iconCodePoint;
  final String? iconFontFamily;
  final String? iconFontPackage;
  final bool iconMatchesTextDirection;
  final int iconColorValue;
  final int backgroundColorValue;
  const Account(
      {required this.id,
      required this.name,
      required this.currency,
      required this.openingBalance,
      this.closingBalance,
      required this.description,
      required this.iconCodePoint,
      this.iconFontFamily,
      this.iconFontPackage,
      required this.iconMatchesTextDirection,
      required this.iconColorValue,
      required this.backgroundColorValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['currency'] = Variable<String>(currency);
    map['opening_balance'] = Variable<BigInt>(openingBalance);
    if (!nullToAbsent || closingBalance != null) {
      map['closing_balance'] = Variable<BigInt>(closingBalance);
    }
    map['description'] = Variable<String>(description);
    map['icon_code_point'] = Variable<int>(iconCodePoint);
    if (!nullToAbsent || iconFontFamily != null) {
      map['icon_font_family'] = Variable<String>(iconFontFamily);
    }
    if (!nullToAbsent || iconFontPackage != null) {
      map['icon_font_package'] = Variable<String>(iconFontPackage);
    }
    map['icon_matches_text_direction'] =
        Variable<bool>(iconMatchesTextDirection);
    map['icon_color_value'] = Variable<int>(iconColorValue);
    map['background_color_value'] = Variable<int>(backgroundColorValue);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      name: Value(name),
      currency: Value(currency),
      openingBalance: Value(openingBalance),
      closingBalance: closingBalance == null && nullToAbsent
          ? const Value.absent()
          : Value(closingBalance),
      description: Value(description),
      iconCodePoint: Value(iconCodePoint),
      iconFontFamily: iconFontFamily == null && nullToAbsent
          ? const Value.absent()
          : Value(iconFontFamily),
      iconFontPackage: iconFontPackage == null && nullToAbsent
          ? const Value.absent()
          : Value(iconFontPackage),
      iconMatchesTextDirection: Value(iconMatchesTextDirection),
      iconColorValue: Value(iconColorValue),
      backgroundColorValue: Value(backgroundColorValue),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      currency: serializer.fromJson<String>(json['currency']),
      openingBalance: serializer.fromJson<BigInt>(json['openingBalance']),
      closingBalance: serializer.fromJson<BigInt?>(json['closingBalance']),
      description: serializer.fromJson<String>(json['description']),
      iconCodePoint: serializer.fromJson<int>(json['iconCodePoint']),
      iconFontFamily: serializer.fromJson<String?>(json['iconFontFamily']),
      iconFontPackage: serializer.fromJson<String?>(json['iconFontPackage']),
      iconMatchesTextDirection:
          serializer.fromJson<bool>(json['iconMatchesTextDirection']),
      iconColorValue: serializer.fromJson<int>(json['iconColorValue']),
      backgroundColorValue:
          serializer.fromJson<int>(json['backgroundColorValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'currency': serializer.toJson<String>(currency),
      'openingBalance': serializer.toJson<BigInt>(openingBalance),
      'closingBalance': serializer.toJson<BigInt?>(closingBalance),
      'description': serializer.toJson<String>(description),
      'iconCodePoint': serializer.toJson<int>(iconCodePoint),
      'iconFontFamily': serializer.toJson<String?>(iconFontFamily),
      'iconFontPackage': serializer.toJson<String?>(iconFontPackage),
      'iconMatchesTextDirection':
          serializer.toJson<bool>(iconMatchesTextDirection),
      'iconColorValue': serializer.toJson<int>(iconColorValue),
      'backgroundColorValue': serializer.toJson<int>(backgroundColorValue),
    };
  }

  Account copyWith(
          {int? id,
          String? name,
          String? currency,
          BigInt? openingBalance,
          Value<BigInt?> closingBalance = const Value.absent(),
          String? description,
          int? iconCodePoint,
          Value<String?> iconFontFamily = const Value.absent(),
          Value<String?> iconFontPackage = const Value.absent(),
          bool? iconMatchesTextDirection,
          int? iconColorValue,
          int? backgroundColorValue}) =>
      Account(
        id: id ?? this.id,
        name: name ?? this.name,
        currency: currency ?? this.currency,
        openingBalance: openingBalance ?? this.openingBalance,
        closingBalance:
            closingBalance.present ? closingBalance.value : this.closingBalance,
        description: description ?? this.description,
        iconCodePoint: iconCodePoint ?? this.iconCodePoint,
        iconFontFamily:
            iconFontFamily.present ? iconFontFamily.value : this.iconFontFamily,
        iconFontPackage: iconFontPackage.present
            ? iconFontPackage.value
            : this.iconFontPackage,
        iconMatchesTextDirection:
            iconMatchesTextDirection ?? this.iconMatchesTextDirection,
        iconColorValue: iconColorValue ?? this.iconColorValue,
        backgroundColorValue: backgroundColorValue ?? this.backgroundColorValue,
      );
  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('currency: $currency, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('closingBalance: $closingBalance, ')
          ..write('description: $description, ')
          ..write('iconCodePoint: $iconCodePoint, ')
          ..write('iconFontFamily: $iconFontFamily, ')
          ..write('iconFontPackage: $iconFontPackage, ')
          ..write('iconMatchesTextDirection: $iconMatchesTextDirection, ')
          ..write('iconColorValue: $iconColorValue, ')
          ..write('backgroundColorValue: $backgroundColorValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      currency,
      openingBalance,
      closingBalance,
      description,
      iconCodePoint,
      iconFontFamily,
      iconFontPackage,
      iconMatchesTextDirection,
      iconColorValue,
      backgroundColorValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.name == this.name &&
          other.currency == this.currency &&
          other.openingBalance == this.openingBalance &&
          other.closingBalance == this.closingBalance &&
          other.description == this.description &&
          other.iconCodePoint == this.iconCodePoint &&
          other.iconFontFamily == this.iconFontFamily &&
          other.iconFontPackage == this.iconFontPackage &&
          other.iconMatchesTextDirection == this.iconMatchesTextDirection &&
          other.iconColorValue == this.iconColorValue &&
          other.backgroundColorValue == this.backgroundColorValue);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> currency;
  final Value<BigInt> openingBalance;
  final Value<BigInt?> closingBalance;
  final Value<String> description;
  final Value<int> iconCodePoint;
  final Value<String?> iconFontFamily;
  final Value<String?> iconFontPackage;
  final Value<bool> iconMatchesTextDirection;
  final Value<int> iconColorValue;
  final Value<int> backgroundColorValue;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.currency = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.closingBalance = const Value.absent(),
    this.description = const Value.absent(),
    this.iconCodePoint = const Value.absent(),
    this.iconFontFamily = const Value.absent(),
    this.iconFontPackage = const Value.absent(),
    this.iconMatchesTextDirection = const Value.absent(),
    this.iconColorValue = const Value.absent(),
    this.backgroundColorValue = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String currency,
    required BigInt openingBalance,
    this.closingBalance = const Value.absent(),
    required String description,
    required int iconCodePoint,
    this.iconFontFamily = const Value.absent(),
    this.iconFontPackage = const Value.absent(),
    required bool iconMatchesTextDirection,
    required int iconColorValue,
    required int backgroundColorValue,
  })  : name = Value(name),
        currency = Value(currency),
        openingBalance = Value(openingBalance),
        description = Value(description),
        iconCodePoint = Value(iconCodePoint),
        iconMatchesTextDirection = Value(iconMatchesTextDirection),
        iconColorValue = Value(iconColorValue),
        backgroundColorValue = Value(backgroundColorValue);
  static Insertable<Account> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? currency,
    Expression<BigInt>? openingBalance,
    Expression<BigInt>? closingBalance,
    Expression<String>? description,
    Expression<int>? iconCodePoint,
    Expression<String>? iconFontFamily,
    Expression<String>? iconFontPackage,
    Expression<bool>? iconMatchesTextDirection,
    Expression<int>? iconColorValue,
    Expression<int>? backgroundColorValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (currency != null) 'currency': currency,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (closingBalance != null) 'closing_balance': closingBalance,
      if (description != null) 'description': description,
      if (iconCodePoint != null) 'icon_code_point': iconCodePoint,
      if (iconFontFamily != null) 'icon_font_family': iconFontFamily,
      if (iconFontPackage != null) 'icon_font_package': iconFontPackage,
      if (iconMatchesTextDirection != null)
        'icon_matches_text_direction': iconMatchesTextDirection,
      if (iconColorValue != null) 'icon_color_value': iconColorValue,
      if (backgroundColorValue != null)
        'background_color_value': backgroundColorValue,
    });
  }

  AccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? currency,
      Value<BigInt>? openingBalance,
      Value<BigInt?>? closingBalance,
      Value<String>? description,
      Value<int>? iconCodePoint,
      Value<String?>? iconFontFamily,
      Value<String?>? iconFontPackage,
      Value<bool>? iconMatchesTextDirection,
      Value<int>? iconColorValue,
      Value<int>? backgroundColorValue}) {
    return AccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      currency: currency ?? this.currency,
      openingBalance: openingBalance ?? this.openingBalance,
      closingBalance: closingBalance ?? this.closingBalance,
      description: description ?? this.description,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      iconFontFamily: iconFontFamily ?? this.iconFontFamily,
      iconFontPackage: iconFontPackage ?? this.iconFontPackage,
      iconMatchesTextDirection:
          iconMatchesTextDirection ?? this.iconMatchesTextDirection,
      iconColorValue: iconColorValue ?? this.iconColorValue,
      backgroundColorValue: backgroundColorValue ?? this.backgroundColorValue,
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
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<BigInt>(openingBalance.value);
    }
    if (closingBalance.present) {
      map['closing_balance'] = Variable<BigInt>(closingBalance.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iconCodePoint.present) {
      map['icon_code_point'] = Variable<int>(iconCodePoint.value);
    }
    if (iconFontFamily.present) {
      map['icon_font_family'] = Variable<String>(iconFontFamily.value);
    }
    if (iconFontPackage.present) {
      map['icon_font_package'] = Variable<String>(iconFontPackage.value);
    }
    if (iconMatchesTextDirection.present) {
      map['icon_matches_text_direction'] =
          Variable<bool>(iconMatchesTextDirection.value);
    }
    if (iconColorValue.present) {
      map['icon_color_value'] = Variable<int>(iconColorValue.value);
    }
    if (backgroundColorValue.present) {
      map['background_color_value'] = Variable<int>(backgroundColorValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('currency: $currency, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('closingBalance: $closingBalance, ')
          ..write('description: $description, ')
          ..write('iconCodePoint: $iconCodePoint, ')
          ..write('iconFontFamily: $iconFontFamily, ')
          ..write('iconFontPackage: $iconFontPackage, ')
          ..write('iconMatchesTextDirection: $iconMatchesTextDirection, ')
          ..write('iconColorValue: $iconColorValue, ')
          ..write('backgroundColorValue: $backgroundColorValue')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDB extends GeneratedDatabase {
  _$LocalDB(QueryExecutor e) : super(e);
  late final $CurrencyTableTable currencyTable = $CurrencyTableTable(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [currencyTable, accounts];
}
