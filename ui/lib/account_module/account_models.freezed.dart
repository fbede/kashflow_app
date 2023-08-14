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
  String get name => throw _privateConstructorUsedError;
  Money get openingBalance => throw _privateConstructorUsedError;
  IconInfo get iconInfo => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

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
      {String name,
      Money openingBalance,
      IconInfo iconInfo,
      String description,
      int? id});

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
    Object? name = null,
    Object? openingBalance = null,
    Object? iconInfo = null,
    Object? description = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      openingBalance: null == openingBalance
          ? _value.openingBalance
          : openingBalance // ignore: cast_nullable_to_non_nullable
              as Money,
      iconInfo: null == iconInfo
          ? _value.iconInfo
          : iconInfo // ignore: cast_nullable_to_non_nullable
              as IconInfo,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {String name,
      Money openingBalance,
      IconInfo iconInfo,
      String description,
      int? id});

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
    Object? name = null,
    Object? openingBalance = null,
    Object? iconInfo = null,
    Object? description = null,
    Object? id = freezed,
  }) {
    return _then(_$_AccountInfo(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      openingBalance: null == openingBalance
          ? _value.openingBalance
          : openingBalance // ignore: cast_nullable_to_non_nullable
              as Money,
      iconInfo: null == iconInfo
          ? _value.iconInfo
          : iconInfo // ignore: cast_nullable_to_non_nullable
              as IconInfo,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_AccountInfo extends _AccountInfo {
  const _$_AccountInfo(
      {required this.name,
      required this.openingBalance,
      required this.iconInfo,
      this.description = '',
      this.id})
      : super._();

  @override
  final String name;
  @override
  final Money openingBalance;
  @override
  final IconInfo iconInfo;
  @override
  @JsonKey()
  final String description;
  @override
  final int? id;

  @override
  String toString() {
    return 'AccountInfo(name: $name, openingBalance: $openingBalance, iconInfo: $iconInfo, description: $description, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountInfo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.openingBalance, openingBalance) ||
                other.openingBalance == openingBalance) &&
            (identical(other.iconInfo, iconInfo) ||
                other.iconInfo == iconInfo) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, openingBalance, iconInfo, description, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountInfoCopyWith<_$_AccountInfo> get copyWith =>
      __$$_AccountInfoCopyWithImpl<_$_AccountInfo>(this, _$identity);
}

abstract class _AccountInfo extends AccountInfo {
  const factory _AccountInfo(
      {required final String name,
      required final Money openingBalance,
      required final IconInfo iconInfo,
      final String description,
      final int? id}) = _$_AccountInfo;
  const _AccountInfo._() : super._();

  @override
  String get name;
  @override
  Money get openingBalance;
  @override
  IconInfo get iconInfo;
  @override
  String get description;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$_AccountInfoCopyWith<_$_AccountInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
