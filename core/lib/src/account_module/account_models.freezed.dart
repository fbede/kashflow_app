// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountInfo {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  CurrencyTableData get currencyInfo => throw _privateConstructorUsedError;
  BigInt get openingBalance => throw _privateConstructorUsedError;
  IconInfo get iconInfo => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountInfoCopyWith<AccountInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountInfoCopyWith<$Res> {
  factory $AccountInfoCopyWith(
          AccountInfo value, $Res Function(AccountInfo) then) =
      _$AccountInfoCopyWithImpl<$Res, AccountInfo>;
  @useResult
  $Res call(
      {String? id,
      String name,
      CurrencyTableData currencyInfo,
      BigInt openingBalance,
      IconInfo iconInfo,
      String description});

  $IconInfoCopyWith<$Res> get iconInfo;
}

/// @nodoc
class _$AccountInfoCopyWithImpl<$Res, $Val extends AccountInfo>
    implements $AccountInfoCopyWith<$Res> {
  _$AccountInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? currencyInfo = freezed,
    Object? openingBalance = null,
    Object? iconInfo = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currencyInfo: freezed == currencyInfo
          ? _value.currencyInfo
          : currencyInfo // ignore: cast_nullable_to_non_nullable
              as CurrencyTableData,
      openingBalance: null == openingBalance
          ? _value.openingBalance
          : openingBalance // ignore: cast_nullable_to_non_nullable
              as BigInt,
      iconInfo: null == iconInfo
          ? _value.iconInfo
          : iconInfo // ignore: cast_nullable_to_non_nullable
              as IconInfo,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IconInfoCopyWith<$Res> get iconInfo {
    return $IconInfoCopyWith<$Res>(_value.iconInfo, (value) {
      return _then(_value.copyWith(iconInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AccountInfoCopyWith<$Res>
    implements $AccountInfoCopyWith<$Res> {
  factory _$$_AccountInfoCopyWith(
          _$_AccountInfo value, $Res Function(_$_AccountInfo) then) =
      __$$_AccountInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      CurrencyTableData currencyInfo,
      BigInt openingBalance,
      IconInfo iconInfo,
      String description});

  @override
  $IconInfoCopyWith<$Res> get iconInfo;
}

/// @nodoc
class __$$_AccountInfoCopyWithImpl<$Res>
    extends _$AccountInfoCopyWithImpl<$Res, _$_AccountInfo>
    implements _$$_AccountInfoCopyWith<$Res> {
  __$$_AccountInfoCopyWithImpl(
      _$_AccountInfo _value, $Res Function(_$_AccountInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? currencyInfo = freezed,
    Object? openingBalance = null,
    Object? iconInfo = null,
    Object? description = null,
  }) {
    return _then(_$_AccountInfo(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currencyInfo: freezed == currencyInfo
          ? _value.currencyInfo
          : currencyInfo // ignore: cast_nullable_to_non_nullable
              as CurrencyTableData,
      openingBalance: null == openingBalance
          ? _value.openingBalance
          : openingBalance // ignore: cast_nullable_to_non_nullable
              as BigInt,
      iconInfo: null == iconInfo
          ? _value.iconInfo
          : iconInfo // ignore: cast_nullable_to_non_nullable
              as IconInfo,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AccountInfo extends _AccountInfo {
  const _$_AccountInfo(
      {required this.id,
      required this.name,
      required this.currencyInfo,
      required this.openingBalance,
      required this.iconInfo,
      this.description = ''})
      : super._();

  @override
  final String? id;
  @override
  final String name;
  @override
  final CurrencyTableData currencyInfo;
  @override
  final BigInt openingBalance;
  @override
  final IconInfo iconInfo;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'AccountInfo._internal(id: $id, name: $name, currencyInfo: $currencyInfo, openingBalance: $openingBalance, iconInfo: $iconInfo, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other.currencyInfo, currencyInfo) &&
            (identical(other.openingBalance, openingBalance) ||
                other.openingBalance == openingBalance) &&
            (identical(other.iconInfo, iconInfo) ||
                other.iconInfo == iconInfo) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(currencyInfo),
      openingBalance,
      iconInfo,
      description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountInfoCopyWith<_$_AccountInfo> get copyWith =>
      __$$_AccountInfoCopyWithImpl<_$_AccountInfo>(this, _$identity);
}

abstract class _AccountInfo extends AccountInfo {
  const factory _AccountInfo(
      {required final String? id,
      required final String name,
      required final CurrencyTableData currencyInfo,
      required final BigInt openingBalance,
      required final IconInfo iconInfo,
      final String description}) = _$_AccountInfo;
  const _AccountInfo._() : super._();

  @override
  String? get id;
  @override
  String get name;
  @override
  CurrencyTableData get currencyInfo;
  @override
  BigInt get openingBalance;
  @override
  IconInfo get iconInfo;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_AccountInfoCopyWith<_$_AccountInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
