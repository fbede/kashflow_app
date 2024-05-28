// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_icon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$assetIconHash() => r'edb38214a78f787e52d05baa6e1194d7e417511a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [assetIcon].
@ProviderFor(assetIcon)
const assetIconProvider = AssetIconFamily();

/// See also [assetIcon].
class AssetIconFamily extends Family {
  /// See also [assetIcon].
  const AssetIconFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'assetIconProvider';

  /// See also [assetIcon].
  AssetIconProvider call(
    AssetIconQuery query,
  ) {
    return AssetIconProvider(
      query,
    );
  }

  @visibleForOverriding
  @override
  AssetIconProvider getProviderOverride(
    covariant AssetIconProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<List<AssetIconTableData>> Function(AssetIconRef ref) create) {
    return _$AssetIconFamilyOverride(this, create);
  }
}

class _$AssetIconFamilyOverride implements FamilyOverride {
  _$AssetIconFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<List<AssetIconTableData>> Function(AssetIconRef ref) create;

  @override
  final AssetIconFamily overriddenFamily;

  @override
  AssetIconProvider getProviderOverride(
    covariant AssetIconProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [assetIcon].
class AssetIconProvider
    extends AutoDisposeFutureProvider<List<AssetIconTableData>> {
  /// See also [assetIcon].
  AssetIconProvider(
    AssetIconQuery query,
  ) : this._internal(
          (ref) => assetIcon(
            ref as AssetIconRef,
            query,
          ),
          from: assetIconProvider,
          name: r'assetIconProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$assetIconHash,
          dependencies: AssetIconFamily._dependencies,
          allTransitiveDependencies: AssetIconFamily._allTransitiveDependencies,
          query: query,
        );

  AssetIconProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final AssetIconQuery query;

  @override
  Override overrideWith(
    FutureOr<List<AssetIconTableData>> Function(AssetIconRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AssetIconProvider._internal(
        (ref) => create(ref as AssetIconRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  (AssetIconQuery,) get argument {
    return (query,);
  }

  @override
  AutoDisposeFutureProviderElement<List<AssetIconTableData>> createElement() {
    return _AssetIconProviderElement(this);
  }

  AssetIconProvider _copyWith(
    FutureOr<List<AssetIconTableData>> Function(AssetIconRef ref) create,
  ) {
    return AssetIconProvider._internal(
      (ref) => create(ref as AssetIconRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      query: query,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AssetIconProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AssetIconRef on AutoDisposeFutureProviderRef<List<AssetIconTableData>> {
  /// The parameter `query` of this provider.
  AssetIconQuery get query;
}

class _AssetIconProviderElement
    extends AutoDisposeFutureProviderElement<List<AssetIconTableData>>
    with AssetIconRef {
  _AssetIconProviderElement(super.provider);

  @override
  AssetIconQuery get query => (origin as AssetIconProvider).query;
}

String _$defaultAccountIconHash() =>
    r'8644791d07b4d7d00035541845863997495ef787';

/// See also [defaultAccountIcon].
@ProviderFor(defaultAccountIcon)
final defaultAccountIconProvider =
    AutoDisposeFutureProvider<AssetIconTableData>.internal(
  defaultAccountIcon,
  name: r'defaultAccountIconProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultAccountIconHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DefaultAccountIconRef
    = AutoDisposeFutureProviderRef<AssetIconTableData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
