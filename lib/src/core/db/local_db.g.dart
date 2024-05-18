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
  VerificationContext validateIntegrity(Insertable<IconTableData> instance,
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
      iconColor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}icon_color']),
      backgroundColor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}background_color']),
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

class IconTableData extends DataClass implements Insertable<IconTableData> {
  final String id;
  final int codePoint;
  final String? fontFamily;
  final String? fontPackage;
  final bool matchTextDirection;
  final int? iconColor;
  final int? backgroundColor;
  final List<String>? fontFamilyFallback;
  const IconTableData(
      {required this.id,
      required this.codePoint,
      this.fontFamily,
      this.fontPackage,
      required this.matchTextDirection,
      this.iconColor,
      this.backgroundColor,
      this.fontFamilyFallback});
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
    if (!nullToAbsent || iconColor != null) {
      map['icon_color'] = Variable<int>(iconColor);
    }
    if (!nullToAbsent || backgroundColor != null) {
      map['background_color'] = Variable<int>(backgroundColor);
    }
    if (!nullToAbsent || fontFamilyFallback != null) {
      map['font_family_fallback'] = Variable<String>($IconTableTable
          .$converterfontFamilyFallback
          .toSql(fontFamilyFallback));
    }
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
      iconColor: iconColor == null && nullToAbsent
          ? const Value.absent()
          : Value(iconColor),
      backgroundColor: backgroundColor == null && nullToAbsent
          ? const Value.absent()
          : Value(backgroundColor),
      fontFamilyFallback: fontFamilyFallback == null && nullToAbsent
          ? const Value.absent()
          : Value(fontFamilyFallback),
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
      iconColor: serializer.fromJson<int?>(json['iconColor']),
      backgroundColor: serializer.fromJson<int?>(json['backgroundColor']),
      fontFamilyFallback:
          serializer.fromJson<List<String>?>(json['fontFamilyFallback']),
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
      'iconColor': serializer.toJson<int?>(iconColor),
      'backgroundColor': serializer.toJson<int?>(backgroundColor),
      'fontFamilyFallback':
          serializer.toJson<List<String>?>(fontFamilyFallback),
    };
  }

  IconTableData copyWith(
          {String? id,
          int? codePoint,
          Value<String?> fontFamily = const Value.absent(),
          Value<String?> fontPackage = const Value.absent(),
          bool? matchTextDirection,
          Value<int?> iconColor = const Value.absent(),
          Value<int?> backgroundColor = const Value.absent(),
          Value<List<String>?> fontFamilyFallback = const Value.absent()}) =>
      IconTableData(
        id: id ?? this.id,
        codePoint: codePoint ?? this.codePoint,
        fontFamily: fontFamily.present ? fontFamily.value : this.fontFamily,
        fontPackage: fontPackage.present ? fontPackage.value : this.fontPackage,
        matchTextDirection: matchTextDirection ?? this.matchTextDirection,
        iconColor: iconColor.present ? iconColor.value : this.iconColor,
        backgroundColor: backgroundColor.present
            ? backgroundColor.value
            : this.backgroundColor,
        fontFamilyFallback: fontFamilyFallback.present
            ? fontFamilyFallback.value
            : this.fontFamilyFallback,
      );
  @override
  String toString() {
    return (StringBuffer('IconTableData(')
          ..write('id: $id, ')
          ..write('codePoint: $codePoint, ')
          ..write('fontFamily: $fontFamily, ')
          ..write('fontPackage: $fontPackage, ')
          ..write('matchTextDirection: $matchTextDirection, ')
          ..write('iconColor: $iconColor, ')
          ..write('backgroundColor: $backgroundColor, ')
          ..write('fontFamilyFallback: $fontFamilyFallback')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, codePoint, fontFamily, fontPackage,
      matchTextDirection, iconColor, backgroundColor, fontFamilyFallback);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IconTableData &&
          other.id == this.id &&
          other.codePoint == this.codePoint &&
          other.fontFamily == this.fontFamily &&
          other.fontPackage == this.fontPackage &&
          other.matchTextDirection == this.matchTextDirection &&
          other.iconColor == this.iconColor &&
          other.backgroundColor == this.backgroundColor &&
          other.fontFamilyFallback == this.fontFamilyFallback);
}

class IconTableCompanion extends UpdateCompanion<IconTableData> {
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
  static Insertable<IconTableData> custom({
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

class $CurrencyTable extends Currency
    with TableInfo<$CurrencyTable, CurrencyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrencyTable(this.attachedDatabase, [this._alias]);
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
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 5),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _patternMeta =
      const VerificationMeta('pattern');
  @override
  late final GeneratedColumn<String> pattern = GeneratedColumn<String>(
      'pattern', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 10),
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
        name
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currency';
  @override
  VerificationContext validateIntegrity(Insertable<CurrencyData> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CurrencyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyData(
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
    );
  }

  @override
  $CurrencyTable createAlias(String alias) {
    return $CurrencyTable(attachedDatabase, alias);
  }
}

class CurrencyData extends DataClass implements Insertable<CurrencyData> {
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
  const CurrencyData(
      {required this.id,
      required this.code,
      required this.decimalDigits,
      required this.symbol,
      required this.pattern,
      required this.groupSeparator,
      required this.decimalSeparator,
      required this.country,
      required this.unit,
      required this.name});
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
    return map;
  }

  CurrencyCompanion toCompanion(bool nullToAbsent) {
    return CurrencyCompanion(
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
    );
  }

  factory CurrencyData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyData(
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
    };
  }

  CurrencyData copyWith(
          {String? id,
          String? code,
          int? decimalDigits,
          String? symbol,
          String? pattern,
          String? groupSeparator,
          String? decimalSeparator,
          String? country,
          String? unit,
          String? name}) =>
      CurrencyData(
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
      );
  @override
  String toString() {
    return (StringBuffer('CurrencyData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('decimalDigits: $decimalDigits, ')
          ..write('symbol: $symbol, ')
          ..write('pattern: $pattern, ')
          ..write('groupSeparator: $groupSeparator, ')
          ..write('decimalSeparator: $decimalSeparator, ')
          ..write('country: $country, ')
          ..write('unit: $unit, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, decimalDigits, symbol, pattern,
      groupSeparator, decimalSeparator, country, unit, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyData &&
          other.id == this.id &&
          other.code == this.code &&
          other.decimalDigits == this.decimalDigits &&
          other.symbol == this.symbol &&
          other.pattern == this.pattern &&
          other.groupSeparator == this.groupSeparator &&
          other.decimalSeparator == this.decimalSeparator &&
          other.country == this.country &&
          other.unit == this.unit &&
          other.name == this.name);
}

class CurrencyCompanion extends UpdateCompanion<CurrencyData> {
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
  final Value<int> rowid;
  const CurrencyCompanion({
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
    this.rowid = const Value.absent(),
  });
  CurrencyCompanion.insert({
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
  static Insertable<CurrencyData> custom({
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
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurrencyCompanion copyWith(
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
      Value<int>? rowid}) {
    return CurrencyCompanion(
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyCompanion(')
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
          GeneratedColumn.constraintIsAlways('REFERENCES currency (id)'));
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
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, currency, description, openingBalance];
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
    );
  }

  @override
  $AccountTableTable createAlias(String alias) {
    return $AccountTableTable(attachedDatabase, alias);
  }
}

class AccountTableData extends DataClass
    implements Insertable<AccountTableData> {
  final String id;
  final String name;
  final String currency;
  final String description;
  final BigInt openingBalance;
  const AccountTableData(
      {required this.id,
      required this.name,
      required this.currency,
      required this.description,
      required this.openingBalance});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['currency'] = Variable<String>(currency);
    map['description'] = Variable<String>(description);
    map['opening_balance'] = Variable<BigInt>(openingBalance);
    return map;
  }

  AccountTableCompanion toCompanion(bool nullToAbsent) {
    return AccountTableCompanion(
      id: Value(id),
      name: Value(name),
      currency: Value(currency),
      description: Value(description),
      openingBalance: Value(openingBalance),
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
    };
  }

  AccountTableData copyWith(
          {String? id,
          String? name,
          String? currency,
          String? description,
          BigInt? openingBalance}) =>
      AccountTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        openingBalance: openingBalance ?? this.openingBalance,
      );
  @override
  String toString() {
    return (StringBuffer('AccountTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('currency: $currency, ')
          ..write('description: $description, ')
          ..write('openingBalance: $openingBalance')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, currency, description, openingBalance);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.currency == this.currency &&
          other.description == this.description &&
          other.openingBalance == this.openingBalance);
}

class AccountTableCompanion extends UpdateCompanion<AccountTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> currency;
  final Value<String> description;
  final Value<BigInt> openingBalance;
  final Value<int> rowid;
  const AccountTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.currency = const Value.absent(),
    this.description = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountTableCompanion.insert({
    required String id,
    required String name,
    required String currency,
    required String description,
    required BigInt openingBalance,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        currency = Value(currency),
        description = Value(description),
        openingBalance = Value(openingBalance);
  static Insertable<AccountTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? currency,
    Expression<String>? description,
    Expression<BigInt>? openingBalance,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (currency != null) 'currency': currency,
      if (description != null) 'description': description,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? currency,
      Value<String>? description,
      Value<BigInt>? openingBalance,
      Value<int>? rowid}) {
    return AccountTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      openingBalance: openingBalance ?? this.openingBalance,
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
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDB extends GeneratedDatabase {
  _$LocalDB(QueryExecutor e) : super(e);
  _$LocalDBManager get managers => _$LocalDBManager(this);
  late final $IconTableTable iconTable = $IconTableTable(this);
  late final $CurrencyTable currency = $CurrencyTable(this);
  late final $AccountTableTable accountTable = $AccountTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [iconTable, currency, accountTable];
}

typedef $$IconTableTableInsertCompanionBuilder = IconTableCompanion Function({
  required String id,
  required int codePoint,
  Value<String?> fontFamily,
  Value<String?> fontPackage,
  required bool matchTextDirection,
  Value<int?> iconColor,
  Value<int?> backgroundColor,
  Value<List<String>?> fontFamilyFallback,
  Value<int> rowid,
});
typedef $$IconTableTableUpdateCompanionBuilder = IconTableCompanion Function({
  Value<String> id,
  Value<int> codePoint,
  Value<String?> fontFamily,
  Value<String?> fontPackage,
  Value<bool> matchTextDirection,
  Value<int?> iconColor,
  Value<int?> backgroundColor,
  Value<List<String>?> fontFamilyFallback,
  Value<int> rowid,
});

class $$IconTableTableTableManager extends RootTableManager<
    _$LocalDB,
    $IconTableTable,
    IconTableData,
    $$IconTableTableFilterComposer,
    $$IconTableTableOrderingComposer,
    $$IconTableTableProcessedTableManager,
    $$IconTableTableInsertCompanionBuilder,
    $$IconTableTableUpdateCompanionBuilder> {
  $$IconTableTableTableManager(_$LocalDB db, $IconTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$IconTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$IconTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$IconTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<int> codePoint = const Value.absent(),
            Value<String?> fontFamily = const Value.absent(),
            Value<String?> fontPackage = const Value.absent(),
            Value<bool> matchTextDirection = const Value.absent(),
            Value<int?> iconColor = const Value.absent(),
            Value<int?> backgroundColor = const Value.absent(),
            Value<List<String>?> fontFamilyFallback = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              IconTableCompanion(
            id: id,
            codePoint: codePoint,
            fontFamily: fontFamily,
            fontPackage: fontPackage,
            matchTextDirection: matchTextDirection,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            fontFamilyFallback: fontFamilyFallback,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String id,
            required int codePoint,
            Value<String?> fontFamily = const Value.absent(),
            Value<String?> fontPackage = const Value.absent(),
            required bool matchTextDirection,
            Value<int?> iconColor = const Value.absent(),
            Value<int?> backgroundColor = const Value.absent(),
            Value<List<String>?> fontFamilyFallback = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              IconTableCompanion.insert(
            id: id,
            codePoint: codePoint,
            fontFamily: fontFamily,
            fontPackage: fontPackage,
            matchTextDirection: matchTextDirection,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            fontFamilyFallback: fontFamilyFallback,
            rowid: rowid,
          ),
        ));
}

class $$IconTableTableProcessedTableManager extends ProcessedTableManager<
    _$LocalDB,
    $IconTableTable,
    IconTableData,
    $$IconTableTableFilterComposer,
    $$IconTableTableOrderingComposer,
    $$IconTableTableProcessedTableManager,
    $$IconTableTableInsertCompanionBuilder,
    $$IconTableTableUpdateCompanionBuilder> {
  $$IconTableTableProcessedTableManager(super.$state);
}

class $$IconTableTableFilterComposer
    extends FilterComposer<_$LocalDB, $IconTableTable> {
  $$IconTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get codePoint => $state.composableBuilder(
      column: $state.table.codePoint,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get fontFamily => $state.composableBuilder(
      column: $state.table.fontFamily,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get fontPackage => $state.composableBuilder(
      column: $state.table.fontPackage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get matchTextDirection => $state.composableBuilder(
      column: $state.table.matchTextDirection,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get iconColor => $state.composableBuilder(
      column: $state.table.iconColor,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get backgroundColor => $state.composableBuilder(
      column: $state.table.backgroundColor,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get fontFamilyFallback => $state.composableBuilder(
          column: $state.table.fontFamilyFallback,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ComposableFilter accountTableRefs(
      ComposableFilter Function($$AccountTableTableFilterComposer f) f) {
    final $$AccountTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.accountTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$AccountTableTableFilterComposer(ComposerState($state.db,
                $state.db.accountTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$IconTableTableOrderingComposer
    extends OrderingComposer<_$LocalDB, $IconTableTable> {
  $$IconTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get codePoint => $state.composableBuilder(
      column: $state.table.codePoint,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get fontFamily => $state.composableBuilder(
      column: $state.table.fontFamily,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get fontPackage => $state.composableBuilder(
      column: $state.table.fontPackage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get matchTextDirection => $state.composableBuilder(
      column: $state.table.matchTextDirection,
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

  ColumnOrderings<String> get fontFamilyFallback => $state.composableBuilder(
      column: $state.table.fontFamilyFallback,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$CurrencyTableInsertCompanionBuilder = CurrencyCompanion Function({
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
  Value<int> rowid,
});
typedef $$CurrencyTableUpdateCompanionBuilder = CurrencyCompanion Function({
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
  Value<int> rowid,
});

class $$CurrencyTableTableManager extends RootTableManager<
    _$LocalDB,
    $CurrencyTable,
    CurrencyData,
    $$CurrencyTableFilterComposer,
    $$CurrencyTableOrderingComposer,
    $$CurrencyTableProcessedTableManager,
    $$CurrencyTableInsertCompanionBuilder,
    $$CurrencyTableUpdateCompanionBuilder> {
  $$CurrencyTableTableManager(_$LocalDB db, $CurrencyTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CurrencyTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CurrencyTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$CurrencyTableProcessedTableManager(p),
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
            Value<int> rowid = const Value.absent(),
          }) =>
              CurrencyCompanion(
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
            Value<int> rowid = const Value.absent(),
          }) =>
              CurrencyCompanion.insert(
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
            rowid: rowid,
          ),
        ));
}

class $$CurrencyTableProcessedTableManager extends ProcessedTableManager<
    _$LocalDB,
    $CurrencyTable,
    CurrencyData,
    $$CurrencyTableFilterComposer,
    $$CurrencyTableOrderingComposer,
    $$CurrencyTableProcessedTableManager,
    $$CurrencyTableInsertCompanionBuilder,
    $$CurrencyTableUpdateCompanionBuilder> {
  $$CurrencyTableProcessedTableManager(super.$state);
}

class $$CurrencyTableFilterComposer
    extends FilterComposer<_$LocalDB, $CurrencyTable> {
  $$CurrencyTableFilterComposer(super.$state);
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

class $$CurrencyTableOrderingComposer
    extends OrderingComposer<_$LocalDB, $CurrencyTable> {
  $$CurrencyTableOrderingComposer(super.$state);
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
}

typedef $$AccountTableTableInsertCompanionBuilder = AccountTableCompanion
    Function({
  required String id,
  required String name,
  required String currency,
  required String description,
  required BigInt openingBalance,
  Value<int> rowid,
});
typedef $$AccountTableTableUpdateCompanionBuilder = AccountTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> currency,
  Value<String> description,
  Value<BigInt> openingBalance,
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
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountTableCompanion(
            id: id,
            name: name,
            currency: currency,
            description: description,
            openingBalance: openingBalance,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String id,
            required String name,
            required String currency,
            required String description,
            required BigInt openingBalance,
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountTableCompanion.insert(
            id: id,
            name: name,
            currency: currency,
            description: description,
            openingBalance: openingBalance,
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

  $$IconTableTableFilterComposer get id {
    final $$IconTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.iconTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$IconTableTableFilterComposer(ComposerState(
                $state.db, $state.db.iconTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$CurrencyTableFilterComposer get currency {
    final $$CurrencyTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currency,
        referencedTable: $state.db.currency,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CurrencyTableFilterComposer(ComposerState(
                $state.db, $state.db.currency, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$AccountTableTableOrderingComposer
    extends OrderingComposer<_$LocalDB, $AccountTableTable> {
  $$AccountTableTableOrderingComposer(super.$state);
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

  $$IconTableTableOrderingComposer get id {
    final $$IconTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.iconTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$IconTableTableOrderingComposer(ComposerState(
                $state.db, $state.db.iconTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$CurrencyTableOrderingComposer get currency {
    final $$CurrencyTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currency,
        referencedTable: $state.db.currency,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CurrencyTableOrderingComposer(ComposerState(
                $state.db, $state.db.currency, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$LocalDBManager {
  final _$LocalDB _db;
  _$LocalDBManager(this._db);
  $$IconTableTableTableManager get iconTable =>
      $$IconTableTableTableManager(_db, _db.iconTable);
  $$CurrencyTableTableManager get currency =>
      $$CurrencyTableTableManager(_db, _db.currency);
  $$AccountTableTableTableManager get accountTable =>
      $$AccountTableTableTableManager(_db, _db.accountTable);
}
