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

DBItem<T> _$DBItemFromJson<T extends Object?>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _DBItem<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$DBItem<T extends Object?> {
  String get serverID => throw _privateConstructorUsedError;
  bool get lastModifiedByServer => throw _privateConstructorUsedError;
  DateTime get lastModified => throw _privateConstructorUsedError;
  T get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DBItemCopyWith<T, DBItem<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DBItemCopyWith<T extends Object?, $Res> {
  factory $DBItemCopyWith(DBItem<T> value, $Res Function(DBItem<T>) then) =
      _$DBItemCopyWithImpl<T, $Res, DBItem<T>>;
  @useResult
  $Res call(
      {String serverID,
      bool lastModifiedByServer,
      DateTime lastModified,
      T item});
}

/// @nodoc
class _$DBItemCopyWithImpl<T extends Object?, $Res, $Val extends DBItem<T>>
    implements $DBItemCopyWith<T, $Res> {
  _$DBItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverID = null,
    Object? lastModifiedByServer = null,
    Object? lastModified = null,
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      serverID: null == serverID
          ? _value.serverID
          : serverID // ignore: cast_nullable_to_non_nullable
              as String,
      lastModifiedByServer: null == lastModifiedByServer
          ? _value.lastModifiedByServer
          : lastModifiedByServer // ignore: cast_nullable_to_non_nullable
              as bool,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DBItemCopyWith<T extends Object?, $Res>
    implements $DBItemCopyWith<T, $Res> {
  factory _$$_DBItemCopyWith(
          _$_DBItem<T> value, $Res Function(_$_DBItem<T>) then) =
      __$$_DBItemCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String serverID,
      bool lastModifiedByServer,
      DateTime lastModified,
      T item});
}

/// @nodoc
class __$$_DBItemCopyWithImpl<T extends Object?, $Res>
    extends _$DBItemCopyWithImpl<T, $Res, _$_DBItem<T>>
    implements _$$_DBItemCopyWith<T, $Res> {
  __$$_DBItemCopyWithImpl(
      _$_DBItem<T> _value, $Res Function(_$_DBItem<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverID = null,
    Object? lastModifiedByServer = null,
    Object? lastModified = null,
    Object? item = freezed,
  }) {
    return _then(_$_DBItem<T>(
      serverID: null == serverID
          ? _value.serverID
          : serverID // ignore: cast_nullable_to_non_nullable
              as String,
      lastModifiedByServer: null == lastModifiedByServer
          ? _value.lastModifiedByServer
          : lastModifiedByServer // ignore: cast_nullable_to_non_nullable
              as bool,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_DBItem<T extends Object?>
    with DiagnosticableTreeMixin
    implements _DBItem<T> {
  const _$_DBItem(
      {required this.serverID,
      required this.lastModifiedByServer,
      required this.lastModified,
      required this.item});

  factory _$_DBItem.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_DBItemFromJson(json, fromJsonT);

  @override
  final String serverID;
  @override
  final bool lastModifiedByServer;
  @override
  final DateTime lastModified;
  @override
  final T item;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DBItem<$T>(serverID: $serverID, lastModifiedByServer: $lastModifiedByServer, lastModified: $lastModified, item: $item)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DBItem<$T>'))
      ..add(DiagnosticsProperty('serverID', serverID))
      ..add(DiagnosticsProperty('lastModifiedByServer', lastModifiedByServer))
      ..add(DiagnosticsProperty('lastModified', lastModified))
      ..add(DiagnosticsProperty('item', item));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DBItem<T> &&
            (identical(other.serverID, serverID) ||
                other.serverID == serverID) &&
            (identical(other.lastModifiedByServer, lastModifiedByServer) ||
                other.lastModifiedByServer == lastModifiedByServer) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified) &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, serverID, lastModifiedByServer,
      lastModified, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DBItemCopyWith<T, _$_DBItem<T>> get copyWith =>
      __$$_DBItemCopyWithImpl<T, _$_DBItem<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_DBItemToJson<T>(this, toJsonT);
  }
}

abstract class _DBItem<T extends Object?> implements DBItem<T> {
  const factory _DBItem(
      {required final String serverID,
      required final bool lastModifiedByServer,
      required final DateTime lastModified,
      required final T item}) = _$_DBItem<T>;

  factory _DBItem.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_DBItem<T>.fromJson;

  @override
  String get serverID;
  @override
  bool get lastModifiedByServer;
  @override
  DateTime get lastModified;
  @override
  T get item;
  @override
  @JsonKey(ignore: true)
  _$$_DBItemCopyWith<T, _$_DBItem<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
