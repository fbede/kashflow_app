// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// ignore_for_file: type=lint
class $IconTableTable extends IconTable
    with TableInfo<$IconTableTable, AppIconData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IconTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codePointMeta =
      const VerificationMeta('codePoint');
  @override
  late final GeneratedColumn<int> codePoint = GeneratedColumn<int>(
      'code_point', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fontFamilyMeta =
      const VerificationMeta('fontFamily');
  @override
  late final GeneratedColumn<String> fontFamily = GeneratedColumn<String>(
      'font_family', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fontPackageMeta =
      const VerificationMeta('fontPackage');
  @override
  late final GeneratedColumn<String> fontPackage = GeneratedColumn<String>(
      'font_package', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _matchTextDirectionMeta =
      const VerificationMeta('matchTextDirection');
  @override
  late final GeneratedColumn<bool> matchTextDirection = GeneratedColumn<bool>(
      'match_text_direction', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("match_text_direction" IN (0, 1))'));
  static const VerificationMeta _iconColorMeta =
      const VerificationMeta('iconColor');
  @override
  late final GeneratedColumn<int> iconColor = GeneratedColumn<int>(
      'icon_color', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _backgroundColorMeta =
      const VerificationMeta('backgroundColor');
  @override
  late final GeneratedColumn<int> backgroundColor = GeneratedColumn<int>(
      'background_color', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _fontFamilyFallbackMeta =
      const VerificationMeta('fontFamilyFallback');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      fontFamilyFallback = GeneratedColumn<String>(
              'font_family_fallback', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $IconTableTable.$converterfontFamilyFallback);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        codePoint,
        fontFamily,
        fontPackage,
        matchTextDirection,
        iconColor,
        backgroundColor,
        fontFamilyFallback
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'icon_table';
  @override
  VerificationContext validateIntegrity(Insertable<AppIconData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code_point')) {
      context.handle(_codePointMeta,
          codePoint.isAcceptableOrUnknown(data['code_point']!, _codePointMeta));
    } else if (isInserting) {
      context.missing(_codePointMeta);
    }
    if (data.containsKey('font_family')) {
      context.handle(
          _fontFamilyMeta,
          fontFamily.isAcceptableOrUnknown(
              data['font_family']!, _fontFamilyMeta));
    }
    if (data.containsKey('font_package')) {
      context.handle(
          _fontPackageMeta,
          fontPackage.isAcceptableOrUnknown(
              data['font_package']!, _fontPackageMeta));
    }
    if (data.containsKey('match_text_direction')) {
      context.handle(
          _matchTextDirectionMeta,
          matchTextDirection.isAcceptableOrUnknown(
              data['match_text_direction']!, _matchTextDirectionMeta));
    } else if (isInserting) {
      context.missing(_matchTextDirectionMeta);
    }
    if (data.containsKey('icon_color')) {
      context.handle(_iconColorMeta,
          iconColor.isAcceptableOrUnknown(data['icon_color']!, _iconColorMeta));
    }
    if (data.containsKey('background_color')) {
      context.handle(
          _backgroundColorMeta,
          backgroundColor.isAcceptableOrUnknown(
              data['background_color']!, _backgroundColorMeta));
    }
    context.handle(_fontFamilyFallbackMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppIconData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppIconData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      iconColor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}icon_color']),
      backgroundColor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}background_color']),
      codePoint: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}code_point'])!,
      fontFamily: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}font_family']),
      fontPackage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}font_package']),
      matchTextDirection: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}match_text_direction'])!,
      fontFamilyFallback: $IconTableTable.$converterfontFamilyFallback.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}font_family_fallback'])),
    );
  }

  @override
  $IconTableTable createAlias(String alias) {
    return $IconTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>?, String?> $converterfontFamilyFallback =
      StringListTypeConverter();
}

class IconTableCompanion extends UpdateCompanion<AppIconData> {
  final Value<String> id;
  final Value<int> codePoint;
  final Value<String?> fontFamily;
  final Value<String?> fontPackage;
  final Value<bool> matchTextDirection;
  final Value<int?> iconColor;
  final Value<int?> backgroundColor;
  final Value<List<String>?> fontFamilyFallback;
  final Value<int> rowid;
  const IconTableCompanion({
    this.id = const Value.absent(),
    this.codePoint = const Value.absent(),
    this.fontFamily = const Value.absent(),
    this.fontPackage = const Value.absent(),
    this.matchTextDirection = const Value.absent(),
    this.iconColor = const Value.absent(),
    this.backgroundColor = const Value.absent(),
    this.fontFamilyFallback = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IconTableCompanion.insert({
    required String id,
    required int codePoint,
    this.fontFamily = const Value.absent(),
    this.fontPackage = const Value.absent(),
    required bool matchTextDirection,
    this.iconColor = const Value.absent(),
    this.backgroundColor = const Value.absent(),
    this.fontFamilyFallback = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        codePoint = Value(codePoint),
        matchTextDirection = Value(matchTextDirection);
  static Insertable<AppIconData> custom({
    Expression<String>? id,
    Expression<int>? codePoint,
    Expression<String>? fontFamily,
    Expression<String>? fontPackage,
    Expression<bool>? matchTextDirection,
    Expression<int>? iconColor,
    Expression<int>? backgroundColor,
    Expression<String>? fontFamilyFallback,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (codePoint != null) 'code_point': codePoint,
      if (fontFamily != null) 'font_family': fontFamily,
      if (fontPackage != null) 'font_package': fontPackage,
      if (matchTextDirection != null)
        'match_text_direction': matchTextDirection,
      if (iconColor != null) 'icon_color': iconColor,
      if (backgroundColor != null) 'background_color': backgroundColor,
      if (fontFamilyFallback != null)
        'font_family_fallback': fontFamilyFallback,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IconTableCompanion copyWith(
      {Value<String>? id,
      Value<int>? codePoint,
      Value<String?>? fontFamily,
      Value<String?>? fontPackage,
      Value<bool>? matchTextDirection,
      Value<int?>? iconColor,
      Value<int?>? backgroundColor,
      Value<List<String>?>? fontFamilyFallback,
      Value<int>? rowid}) {
    return IconTableCompanion(
      id: id ?? this.id,
      codePoint: codePoint ?? this.codePoint,
      fontFamily: fontFamily ?? this.fontFamily,
      fontPackage: fontPackage ?? this.fontPackage,
      matchTextDirection: matchTextDirection ?? this.matchTextDirection,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (codePoint.present) {
      map['code_point'] = Variable<int>(codePoint.value);
    }
    if (fontFamily.present) {
      map['font_family'] = Variable<String>(fontFamily.value);
    }
    if (fontPackage.present) {
      map['font_package'] = Variable<String>(fontPackage.value);
    }
    if (matchTextDirection.present) {
      map['match_text_direction'] = Variable<bool>(matchTextDirection.value);
    }
    if (iconColor.present) {
      map['icon_color'] = Variable<int>(iconColor.value);
    }
    if (backgroundColor.present) {
      map['background_color'] = Variable<int>(backgroundColor.value);
    }
    if (fontFamilyFallback.present) {
      map['font_family_fallback'] = Variable<String>($IconTableTable
          .$converterfontFamilyFallback
          .toSql(fontFamilyFallback.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IconTableCompanion(')
          ..write('id: $id, ')
          ..write('codePoint: $codePoint, ')
          ..write('fontFamily: $fontFamily, ')
          ..write('fontPackage: $fontPackage, ')
          ..write('matchTextDirection: $matchTextDirection, ')
          ..write('iconColor: $iconColor, ')
          ..write('backgroundColor: $backgroundColor, ')
          ..write('fontFamilyFallback: $fontFamilyFallback, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CurrencyTableTable extends CurrencyTable
    with TableInfo<$CurrencyTableTable, AppCurrency> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrencyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hasBeenUsedMeta =
      const VerificationMeta('hasBeenUsed');
  @override
  late final GeneratedColumn<bool> hasBeenUsed = GeneratedColumn<bool>(
      'has_been_used', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_been_used" IN (0, 1))'));
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 10),
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
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
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
  List<GeneratedColumn> get $columns => [
        id,
        hasBeenUsed,
        code,
        scale,
        symbol,
        invertSeparators,
        pattern,
        country,
        unit,
        name
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currency_table';
  @override
  VerificationContext validateIntegrity(Insertable<AppCurrency> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('has_been_used')) {
      context.handle(
          _hasBeenUsedMeta,
          hasBeenUsed.isAcceptableOrUnknown(
              data['has_been_used']!, _hasBeenUsedMeta));
    } else if (isInserting) {
      context.missing(_hasBeenUsedMeta);
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
  AppCurrency map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppCurrency(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      scale: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}scale'])!,
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      invertSeparators: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}invert_separators'])!,
      hasBeenUsed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_been_used'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      pattern: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pattern'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
    );
  }

  @override
  $CurrencyTableTable createAlias(String alias) {
    return $CurrencyTableTable(attachedDatabase, alias);
  }
}

class CurrencyTableCompanion extends UpdateCompanion<AppCurrency> {
  final Value<String> id;
  final Value<bool> hasBeenUsed;
  final Value<String> code;
  final Value<int> scale;
  final Value<String> symbol;
  final Value<bool> invertSeparators;
  final Value<String> pattern;
  final Value<String> country;
  final Value<String> unit;
  final Value<String> name;
  final Value<int> rowid;
  const CurrencyTableCompanion({
    this.id = const Value.absent(),
    this.hasBeenUsed = const Value.absent(),
    this.code = const Value.absent(),
    this.scale = const Value.absent(),
    this.symbol = const Value.absent(),
    this.invertSeparators = const Value.absent(),
    this.pattern = const Value.absent(),
    this.country = const Value.absent(),
    this.unit = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurrencyTableCompanion.insert({
    required String id,
    required bool hasBeenUsed,
    required String code,
    required int scale,
    required String symbol,
    required bool invertSeparators,
    required String pattern,
    required String country,
    required String unit,
    required String name,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        hasBeenUsed = Value(hasBeenUsed),
        code = Value(code),
        scale = Value(scale),
        symbol = Value(symbol),
        invertSeparators = Value(invertSeparators),
        pattern = Value(pattern),
        country = Value(country),
        unit = Value(unit),
        name = Value(name);
  static Insertable<AppCurrency> custom({
    Expression<String>? id,
    Expression<bool>? hasBeenUsed,
    Expression<String>? code,
    Expression<int>? scale,
    Expression<String>? symbol,
    Expression<bool>? invertSeparators,
    Expression<String>? pattern,
    Expression<String>? country,
    Expression<String>? unit,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hasBeenUsed != null) 'has_been_used': hasBeenUsed,
      if (code != null) 'code': code,
      if (scale != null) 'scale': scale,
      if (symbol != null) 'symbol': symbol,
      if (invertSeparators != null) 'invert_separators': invertSeparators,
      if (pattern != null) 'pattern': pattern,
      if (country != null) 'country': country,
      if (unit != null) 'unit': unit,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurrencyTableCompanion copyWith(
      {Value<String>? id,
      Value<bool>? hasBeenUsed,
      Value<String>? code,
      Value<int>? scale,
      Value<String>? symbol,
      Value<bool>? invertSeparators,
      Value<String>? pattern,
      Value<String>? country,
      Value<String>? unit,
      Value<String>? name,
      Value<int>? rowid}) {
    return CurrencyTableCompanion(
      id: id ?? this.id,
      hasBeenUsed: hasBeenUsed ?? this.hasBeenUsed,
      code: code ?? this.code,
      scale: scale ?? this.scale,
      symbol: symbol ?? this.symbol,
      invertSeparators: invertSeparators ?? this.invertSeparators,
      pattern: pattern ?? this.pattern,
      country: country ?? this.country,
      unit: unit ?? this.unit,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (hasBeenUsed.present) {
      map['has_been_used'] = Variable<bool>(hasBeenUsed.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyTableCompanion(')
          ..write('id: $id, ')
          ..write('hasBeenUsed: $hasBeenUsed, ')
          ..write('code: $code, ')
          ..write('scale: $scale, ')
          ..write('symbol: $symbol, ')
          ..write('invertSeparators: $invertSeparators, ')
          ..write('pattern: $pattern, ')
          ..write('country: $country, ')
          ..write('unit: $unit, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES icon_table (id)'));
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
  static const VerificationMeta _closingBalanceMeta =
      const VerificationMeta('closingBalance');
  @override
  late final GeneratedColumn<BigInt> closingBalance = GeneratedColumn<BigInt>(
      'closing_balance', aliasedName, true,
      type: DriftSqlType.bigInt, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, currency, description, openingBalance, closingBalance];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
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
    if (data.containsKey('closing_balance')) {
      context.handle(
          _closingBalanceMeta,
          closingBalance.isAcceptableOrUnknown(
              data['closing_balance']!, _closingBalanceMeta));
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      openingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.bigInt, data['${effectivePrefix}opening_balance'])!,
      closingBalance: attachedDatabase.typeMapping
          .read(DriftSqlType.bigInt, data['${effectivePrefix}closing_balance']),
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class Account extends DataClass implements Insertable<Account> {
  final String id;
  final String name;
  final String currency;
  final String description;
  final BigInt openingBalance;
  final BigInt? closingBalance;
  const Account(
      {required this.id,
      required this.name,
      required this.currency,
      required this.description,
      required this.openingBalance,
      this.closingBalance});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['currency'] = Variable<String>(currency);
    map['description'] = Variable<String>(description);
    map['opening_balance'] = Variable<BigInt>(openingBalance);
    if (!nullToAbsent || closingBalance != null) {
      map['closing_balance'] = Variable<BigInt>(closingBalance);
    }
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      name: Value(name),
      currency: Value(currency),
      description: Value(description),
      openingBalance: Value(openingBalance),
      closingBalance: closingBalance == null && nullToAbsent
          ? const Value.absent()
          : Value(closingBalance),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      currency: serializer.fromJson<String>(json['currency']),
      description: serializer.fromJson<String>(json['description']),
      openingBalance: serializer.fromJson<BigInt>(json['openingBalance']),
      closingBalance: serializer.fromJson<BigInt?>(json['closingBalance']),
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
      'closingBalance': serializer.toJson<BigInt?>(closingBalance),
    };
  }

  Account copyWith(
          {String? id,
          String? name,
          String? currency,
          String? description,
          BigInt? openingBalance,
          Value<BigInt?> closingBalance = const Value.absent()}) =>
      Account(
        id: id ?? this.id,
        name: name ?? this.name,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        openingBalance: openingBalance ?? this.openingBalance,
        closingBalance:
            closingBalance.present ? closingBalance.value : this.closingBalance,
      );
  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('currency: $currency, ')
          ..write('description: $description, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('closingBalance: $closingBalance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, currency, description, openingBalance, closingBalance);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.name == this.name &&
          other.currency == this.currency &&
          other.description == this.description &&
          other.openingBalance == this.openingBalance &&
          other.closingBalance == this.closingBalance);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> currency;
  final Value<String> description;
  final Value<BigInt> openingBalance;
  final Value<BigInt?> closingBalance;
  final Value<int> rowid;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.currency = const Value.absent(),
    this.description = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.closingBalance = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountsCompanion.insert({
    required String id,
    required String name,
    required String currency,
    required String description,
    required BigInt openingBalance,
    this.closingBalance = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        currency = Value(currency),
        description = Value(description),
        openingBalance = Value(openingBalance);
  static Insertable<Account> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? currency,
    Expression<String>? description,
    Expression<BigInt>? openingBalance,
    Expression<BigInt>? closingBalance,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (currency != null) 'currency': currency,
      if (description != null) 'description': description,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (closingBalance != null) 'closing_balance': closingBalance,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? currency,
      Value<String>? description,
      Value<BigInt>? openingBalance,
      Value<BigInt?>? closingBalance,
      Value<int>? rowid}) {
    return AccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      openingBalance: openingBalance ?? this.openingBalance,
      closingBalance: closingBalance ?? this.closingBalance,
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
    if (closingBalance.present) {
      map['closing_balance'] = Variable<BigInt>(closingBalance.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('currency: $currency, ')
          ..write('description: $description, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('closingBalance: $closingBalance, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDB extends GeneratedDatabase {
  _$LocalDB(QueryExecutor e) : super(e);
  late final $IconTableTable iconTable = $IconTableTable(this);
  late final $CurrencyTableTable currencyTable = $CurrencyTableTable(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final LocalCurrencyDao localCurrencyDao =
      LocalCurrencyDao(this as LocalDB);
  late final LocalAccountsDao localAccountsDao =
      LocalAccountsDao(this as LocalDB);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [iconTable, currencyTable, accounts];
}
