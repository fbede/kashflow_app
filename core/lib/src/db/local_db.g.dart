// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// ignore_for_file: type=lint
class $IconTableTable extends IconTable
    with TableInfo<$IconTableTable, IconTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IconTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => _uuid.generate());
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
  static const VerificationMeta _colorValueMeta =
      const VerificationMeta('colorValue');
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
      'color_value', aliasedName, false,
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
        codePoint,
        fontFamily,
        fontPackage,
        matchTextDirection,
        colorValue,
        backgroundColorValue
      ];
  @override
  String get aliasedName => _alias ?? 'icon_table';
  @override
  String get actualTableName => 'icon_table';
  @override
  VerificationContext validateIntegrity(Insertable<IconTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('color_value')) {
      context.handle(
          _colorValueMeta,
          colorValue.isAcceptableOrUnknown(
              data['color_value']!, _colorValueMeta));
    } else if (isInserting) {
      context.missing(_colorValueMeta);
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
  IconTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IconTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      codePoint: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}code_point'])!,
      fontFamily: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}font_family']),
      fontPackage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}font_package']),
      matchTextDirection: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}match_text_direction'])!,
      colorValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color_value'])!,
      backgroundColorValue: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}background_color_value'])!,
    );
  }

  @override
  $IconTableTable createAlias(String alias) {
    return $IconTableTable(attachedDatabase, alias);
  }
}

class IconTableData extends DataClass implements Insertable<IconTableData> {
  final String id;
  final int codePoint;
  final String? fontFamily;
  final String? fontPackage;
  final bool matchTextDirection;
  final int colorValue;
  final int backgroundColorValue;
  const IconTableData(
      {required this.id,
      required this.codePoint,
      this.fontFamily,
      this.fontPackage,
      required this.matchTextDirection,
      required this.colorValue,
      required this.backgroundColorValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code_point'] = Variable<int>(codePoint);
    if (!nullToAbsent || fontFamily != null) {
      map['font_family'] = Variable<String>(fontFamily);
    }
    if (!nullToAbsent || fontPackage != null) {
      map['font_package'] = Variable<String>(fontPackage);
    }
    map['match_text_direction'] = Variable<bool>(matchTextDirection);
    map['color_value'] = Variable<int>(colorValue);
    map['background_color_value'] = Variable<int>(backgroundColorValue);
    return map;
  }

  IconTableCompanion toCompanion(bool nullToAbsent) {
    return IconTableCompanion(
      id: Value(id),
      codePoint: Value(codePoint),
      fontFamily: fontFamily == null && nullToAbsent
          ? const Value.absent()
          : Value(fontFamily),
      fontPackage: fontPackage == null && nullToAbsent
          ? const Value.absent()
          : Value(fontPackage),
      matchTextDirection: Value(matchTextDirection),
      colorValue: Value(colorValue),
      backgroundColorValue: Value(backgroundColorValue),
    );
  }

  factory IconTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IconTableData(
      id: serializer.fromJson<String>(json['id']),
      codePoint: serializer.fromJson<int>(json['codePoint']),
      fontFamily: serializer.fromJson<String?>(json['fontFamily']),
      fontPackage: serializer.fromJson<String?>(json['fontPackage']),
      matchTextDirection: serializer.fromJson<bool>(json['matchTextDirection']),
      colorValue: serializer.fromJson<int>(json['colorValue']),
      backgroundColorValue:
          serializer.fromJson<int>(json['backgroundColorValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'codePoint': serializer.toJson<int>(codePoint),
      'fontFamily': serializer.toJson<String?>(fontFamily),
      'fontPackage': serializer.toJson<String?>(fontPackage),
      'matchTextDirection': serializer.toJson<bool>(matchTextDirection),
      'colorValue': serializer.toJson<int>(colorValue),
      'backgroundColorValue': serializer.toJson<int>(backgroundColorValue),
    };
  }

  IconTableData copyWith(
          {String? id,
          int? codePoint,
          Value<String?> fontFamily = const Value.absent(),
          Value<String?> fontPackage = const Value.absent(),
          bool? matchTextDirection,
          int? colorValue,
          int? backgroundColorValue}) =>
      IconTableData(
        id: id ?? this.id,
        codePoint: codePoint ?? this.codePoint,
        fontFamily: fontFamily.present ? fontFamily.value : this.fontFamily,
        fontPackage: fontPackage.present ? fontPackage.value : this.fontPackage,
        matchTextDirection: matchTextDirection ?? this.matchTextDirection,
        colorValue: colorValue ?? this.colorValue,
        backgroundColorValue: backgroundColorValue ?? this.backgroundColorValue,
      );
  @override
  String toString() {
    return (StringBuffer('IconTableData(')
          ..write('id: $id, ')
          ..write('codePoint: $codePoint, ')
          ..write('fontFamily: $fontFamily, ')
          ..write('fontPackage: $fontPackage, ')
          ..write('matchTextDirection: $matchTextDirection, ')
          ..write('colorValue: $colorValue, ')
          ..write('backgroundColorValue: $backgroundColorValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, codePoint, fontFamily, fontPackage,
      matchTextDirection, colorValue, backgroundColorValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IconTableData &&
          other.id == this.id &&
          other.codePoint == this.codePoint &&
          other.fontFamily == this.fontFamily &&
          other.fontPackage == this.fontPackage &&
          other.matchTextDirection == this.matchTextDirection &&
          other.colorValue == this.colorValue &&
          other.backgroundColorValue == this.backgroundColorValue);
}

class IconTableCompanion extends UpdateCompanion<IconTableData> {
  final Value<String> id;
  final Value<int> codePoint;
  final Value<String?> fontFamily;
  final Value<String?> fontPackage;
  final Value<bool> matchTextDirection;
  final Value<int> colorValue;
  final Value<int> backgroundColorValue;
  final Value<int> rowid;
  const IconTableCompanion({
    this.id = const Value.absent(),
    this.codePoint = const Value.absent(),
    this.fontFamily = const Value.absent(),
    this.fontPackage = const Value.absent(),
    this.matchTextDirection = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.backgroundColorValue = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IconTableCompanion.insert({
    this.id = const Value.absent(),
    required int codePoint,
    this.fontFamily = const Value.absent(),
    this.fontPackage = const Value.absent(),
    required bool matchTextDirection,
    required int colorValue,
    required int backgroundColorValue,
    this.rowid = const Value.absent(),
  })  : codePoint = Value(codePoint),
        matchTextDirection = Value(matchTextDirection),
        colorValue = Value(colorValue),
        backgroundColorValue = Value(backgroundColorValue);
  static Insertable<IconTableData> custom({
    Expression<String>? id,
    Expression<int>? codePoint,
    Expression<String>? fontFamily,
    Expression<String>? fontPackage,
    Expression<bool>? matchTextDirection,
    Expression<int>? colorValue,
    Expression<int>? backgroundColorValue,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (codePoint != null) 'code_point': codePoint,
      if (fontFamily != null) 'font_family': fontFamily,
      if (fontPackage != null) 'font_package': fontPackage,
      if (matchTextDirection != null)
        'match_text_direction': matchTextDirection,
      if (colorValue != null) 'color_value': colorValue,
      if (backgroundColorValue != null)
        'background_color_value': backgroundColorValue,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IconTableCompanion copyWith(
      {Value<String>? id,
      Value<int>? codePoint,
      Value<String?>? fontFamily,
      Value<String?>? fontPackage,
      Value<bool>? matchTextDirection,
      Value<int>? colorValue,
      Value<int>? backgroundColorValue,
      Value<int>? rowid}) {
    return IconTableCompanion(
      id: id ?? this.id,
      codePoint: codePoint ?? this.codePoint,
      fontFamily: fontFamily ?? this.fontFamily,
      fontPackage: fontPackage ?? this.fontPackage,
      matchTextDirection: matchTextDirection ?? this.matchTextDirection,
      colorValue: colorValue ?? this.colorValue,
      backgroundColorValue: backgroundColorValue ?? this.backgroundColorValue,
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
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (backgroundColorValue.present) {
      map['background_color_value'] = Variable<int>(backgroundColorValue.value);
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
          ..write('colorValue: $colorValue, ')
          ..write('backgroundColorValue: $backgroundColorValue, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

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
      clientDefault: () => _uuid.generate());
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
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
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
  final String id;
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
    map['id'] = Variable<String>(id);
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
      id: serializer.fromJson<String>(json['id']),
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
      'id': serializer.toJson<String>(id),
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
          {String? id,
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
  final Value<String> id;
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
    this.id = const Value.absent(),
    required String code,
    required int scale,
    required String symbol,
    required bool invertSeparators,
    required String pattern,
    required String country,
    required String unit,
    required String name,
    this.rowid = const Value.absent(),
  })  : code = Value(code),
        scale = Value(scale),
        symbol = Value(symbol),
        invertSeparators = Value(invertSeparators),
        pattern = Value(pattern),
        country = Value(country),
        unit = Value(unit),
        name = Value(name);
  static Insertable<CurrencyTableData> custom({
    Expression<String>? id,
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
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [iconTable, currencyTable, accounts];
}
