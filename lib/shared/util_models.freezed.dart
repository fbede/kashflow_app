// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'util_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Group<T> _$GroupFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _Group<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$Group<T> {
  String get groupName => throw _privateConstructorUsedError;
  T get object => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupCopyWith<T, Group<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCopyWith<T, $Res> {
  factory $GroupCopyWith(Group<T> value, $Res Function(Group<T>) then) =
      _$GroupCopyWithImpl<T, $Res, Group<T>>;
  @useResult
  $Res call({String groupName, T object});
}

/// @nodoc
class _$GroupCopyWithImpl<T, $Res, $Val extends Group<T>>
    implements $GroupCopyWith<T, $Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupName = null,
    Object? object = freezed,
  }) {
    return _then(_value.copyWith(
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GroupCopyWith<T, $Res> implements $GroupCopyWith<T, $Res> {
  factory _$$_GroupCopyWith(
          _$_Group<T> value, $Res Function(_$_Group<T>) then) =
      __$$_GroupCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String groupName, T object});
}

/// @nodoc
class __$$_GroupCopyWithImpl<T, $Res>
    extends _$GroupCopyWithImpl<T, $Res, _$_Group<T>>
    implements _$$_GroupCopyWith<T, $Res> {
  __$$_GroupCopyWithImpl(_$_Group<T> _value, $Res Function(_$_Group<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupName = null,
    Object? object = freezed,
  }) {
    return _then(_$_Group<T>(
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_Group<T> with DiagnosticableTreeMixin implements _Group<T> {
  const _$_Group({required this.groupName, required this.object});

  factory _$_Group.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_GroupFromJson(json, fromJsonT);

  @override
  final String groupName;
  @override
  final T object;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Group<$T>(groupName: $groupName, object: $object)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Group<$T>'))
      ..add(DiagnosticsProperty('groupName', groupName))
      ..add(DiagnosticsProperty('object', object));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Group<T> &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            const DeepCollectionEquality().equals(other.object, object));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, groupName, const DeepCollectionEquality().hash(object));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GroupCopyWith<T, _$_Group<T>> get copyWith =>
      __$$_GroupCopyWithImpl<T, _$_Group<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_GroupToJson<T>(this, toJsonT);
  }
}

abstract class _Group<T> implements Group<T> {
  const factory _Group(
      {required final String groupName, required final T object}) = _$_Group<T>;

  factory _Group.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_Group<T>.fromJson;

  @override
  String get groupName;
  @override
  T get object;
  @override
  @JsonKey(ignore: true)
  _$$_GroupCopyWith<T, _$_Group<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
