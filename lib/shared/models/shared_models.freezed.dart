// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shared_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IconInfo {
  IconData get iconData => throw _privateConstructorUsedError;
  Color get iconColor => throw _privateConstructorUsedError;
  Color get backgroundColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IconInfoCopyWith<IconInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IconInfoCopyWith<$Res> {
  factory $IconInfoCopyWith(IconInfo value, $Res Function(IconInfo) then) =
      _$IconInfoCopyWithImpl<$Res, IconInfo>;
  @useResult
  $Res call({IconData iconData, Color iconColor, Color backgroundColor});
}

/// @nodoc
class _$IconInfoCopyWithImpl<$Res, $Val extends IconInfo>
    implements $IconInfoCopyWith<$Res> {
  _$IconInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconData = null,
    Object? iconColor = null,
    Object? backgroundColor = null,
  }) {
    return _then(_value.copyWith(
      iconData: null == iconData
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
      iconColor: null == iconColor
          ? _value.iconColor
          : iconColor // ignore: cast_nullable_to_non_nullable
              as Color,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IconInfoCopyWith<$Res> implements $IconInfoCopyWith<$Res> {
  factory _$$_IconInfoCopyWith(
          _$_IconInfo value, $Res Function(_$_IconInfo) then) =
      __$$_IconInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IconData iconData, Color iconColor, Color backgroundColor});
}

/// @nodoc
class __$$_IconInfoCopyWithImpl<$Res>
    extends _$IconInfoCopyWithImpl<$Res, _$_IconInfo>
    implements _$$_IconInfoCopyWith<$Res> {
  __$$_IconInfoCopyWithImpl(
      _$_IconInfo _value, $Res Function(_$_IconInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconData = null,
    Object? iconColor = null,
    Object? backgroundColor = null,
  }) {
    return _then(_$_IconInfo(
      iconData: null == iconData
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
      iconColor: null == iconColor
          ? _value.iconColor
          : iconColor // ignore: cast_nullable_to_non_nullable
              as Color,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_IconInfo implements _IconInfo {
  const _$_IconInfo(
      {required this.iconData,
      required this.iconColor,
      required this.backgroundColor});

  @override
  final IconData iconData;
  @override
  final Color iconColor;
  @override
  final Color backgroundColor;

  @override
  String toString() {
    return 'IconInfo(iconData: $iconData, iconColor: $iconColor, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IconInfo &&
            (identical(other.iconData, iconData) ||
                other.iconData == iconData) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, iconData, iconColor, backgroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IconInfoCopyWith<_$_IconInfo> get copyWith =>
      __$$_IconInfoCopyWithImpl<_$_IconInfo>(this, _$identity);
}

abstract class _IconInfo implements IconInfo {
  const factory _IconInfo(
      {required final IconData iconData,
      required final Color iconColor,
      required final Color backgroundColor}) = _$_IconInfo;

  @override
  IconData get iconData;
  @override
  Color get iconColor;
  @override
  Color get backgroundColor;
  @override
  @JsonKey(ignore: true)
  _$$_IconInfoCopyWith<_$_IconInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
