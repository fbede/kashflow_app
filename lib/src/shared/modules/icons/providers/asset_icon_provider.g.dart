// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_icon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$assetIconHash() => r'bfbb5c6003052ecf048e7d73d259c84be623b4cd';

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
const assetIconPresenter = AssetIconFamily();

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
  String? get name => r'assetIconPresenter';

  /// See also [assetIcon].
  AssetIconProvider call(
    String searchTerm, {
    AssetIconInteractor? currencyInteractor,
  }) {
    return AssetIconProvider(
      searchTerm,
      currencyInteractor: currencyInteractor,
    );
  }

  @visibleForOverriding
  @override
  AssetIconProvider getProviderOverride(
    covariant AssetIconProvider provider,
  ) {
    return call(
      provider.searchTerm,
      currencyInteractor: provider.currencyInteractor,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Stream<List<AssetIconTableData>> Function(AssetIconRef ref) create) {
    return _$AssetIconFamilyOverride(this, create);
  }
}

class _$AssetIconFamilyOverride implements FamilyOverride {
  _$AssetIconFamilyOverride(this.overriddenFamily, this.create);

  final Stream<List<AssetIconTableData>> Function(AssetIconRef ref) create;

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
    extends AutoDisposeStreamProvider<List<AssetIconTableData>> {
  /// See also [assetIcon].
  AssetIconProvider(
    String searchTerm, {
    AssetIconInteractor? currencyInteractor,
  }) : this._internal(
          (ref) => assetIcon(
            ref as AssetIconRef,
            searchTerm,
            currencyInteractor: currencyInteractor,
          ),
          from: assetIconPresenter,
          name: r'assetIconPresenter',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$assetIconHash,
          dependencies: AssetIconFamily._dependencies,
          allTransitiveDependencies: AssetIconFamily._allTransitiveDependencies,
          searchTerm: searchTerm,
          currencyInteractor: currencyInteractor,
        );

  AssetIconProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchTerm,
    required this.currencyInteractor,
  }) : super.internal();

  final String searchTerm;
  final AssetIconInteractor? currencyInteractor;

  @override
  Override overrideWith(
    Stream<List<AssetIconTableData>> Function(AssetIconRef ref) create,
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
        searchTerm: searchTerm,
        currencyInteractor: currencyInteractor,
      ),
    );
  }

  @override
  (
    String, {
    AssetIconInteractor? currencyInteractor,
  }) get argument {
    return (
      searchTerm,
      currencyInteractor: currencyInteractor,
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<AssetIconTableData>> createElement() {
    return _AssetIconProviderElement(this);
  }

  AssetIconProvider _copyWith(
    Stream<List<AssetIconTableData>> Function(AssetIconRef ref) create,
  ) {
    return AssetIconProvider._internal(
      (ref) => create(ref as AssetIconRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      searchTerm: searchTerm,
      currencyInteractor: currencyInteractor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AssetIconProvider &&
        other.searchTerm == searchTerm &&
        other.currencyInteractor == currencyInteractor;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchTerm.hashCode);
    hash = _SystemHash.combine(hash, currencyInteractor.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AssetIconRef on AutoDisposeStreamProviderRef<List<AssetIconTableData>> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;

  /// The parameter `currencyInteractor` of this provider.
  AssetIconInteractor? get currencyInteractor;
}

class _AssetIconProviderElement
    extends AutoDisposeStreamProviderElement<List<AssetIconTableData>>
    with AssetIconRef {
  _AssetIconProviderElement(super.provider);

  @override
  String get searchTerm => (origin as AssetIconProvider).searchTerm;
  @override
  AssetIconInteractor? get currencyInteractor =>
      (origin as AssetIconProvider).currencyInteractor;
}

String _$defaultAccountIconHash() =>
    r'ac2eba8bde14fe55319d9a2759367463937b29a2';

/// See also [defaultAccountIcon].
@ProviderFor(defaultAccountIcon)
const defaultAccountIconPresenter = DefaultAccountIconFamily();

/// See also [defaultAccountIcon].
class DefaultAccountIconFamily extends Family {
  /// See also [defaultAccountIcon].
  const DefaultAccountIconFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'defaultAccountIconPresenter';

  /// See also [defaultAccountIcon].
  DefaultAccountIconProvider call({
    AssetIconInteractor? currencyInteractor,
  }) {
    return DefaultAccountIconProvider(
      currencyInteractor: currencyInteractor,
    );
  }

  @visibleForOverriding
  @override
  DefaultAccountIconProvider getProviderOverride(
    covariant DefaultAccountIconProvider provider,
  ) {
    return call(
      currencyInteractor: provider.currencyInteractor,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<AssetIconTableData> Function(DefaultAccountIconRef ref) create) {
    return _$DefaultAccountIconFamilyOverride(this, create);
  }
}

class _$DefaultAccountIconFamilyOverride implements FamilyOverride {
  _$DefaultAccountIconFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<AssetIconTableData> Function(DefaultAccountIconRef ref) create;

  @override
  final DefaultAccountIconFamily overriddenFamily;

  @override
  DefaultAccountIconProvider getProviderOverride(
    covariant DefaultAccountIconProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [defaultAccountIcon].
class DefaultAccountIconProvider
    extends AutoDisposeFutureProvider<AssetIconTableData> {
  /// See also [defaultAccountIcon].
  DefaultAccountIconProvider({
    AssetIconInteractor? currencyInteractor,
  }) : this._internal(
          (ref) => defaultAccountIcon(
            ref as DefaultAccountIconRef,
            currencyInteractor: currencyInteractor,
          ),
          from: defaultAccountIconPresenter,
          name: r'defaultAccountIconPresenter',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$defaultAccountIconHash,
          dependencies: DefaultAccountIconFamily._dependencies,
          allTransitiveDependencies:
              DefaultAccountIconFamily._allTransitiveDependencies,
          currencyInteractor: currencyInteractor,
        );

  DefaultAccountIconProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currencyInteractor,
  }) : super.internal();

  final AssetIconInteractor? currencyInteractor;

  @override
  Override overrideWith(
    FutureOr<AssetIconTableData> Function(DefaultAccountIconRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DefaultAccountIconProvider._internal(
        (ref) => create(ref as DefaultAccountIconRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currencyInteractor: currencyInteractor,
      ),
    );
  }

  @override
  ({
    AssetIconInteractor? currencyInteractor,
  }) get argument {
    return (currencyInteractor: currencyInteractor,);
  }

  @override
  AutoDisposeFutureProviderElement<AssetIconTableData> createElement() {
    return _DefaultAccountIconProviderElement(this);
  }

  DefaultAccountIconProvider _copyWith(
    FutureOr<AssetIconTableData> Function(DefaultAccountIconRef ref) create,
  ) {
    return DefaultAccountIconProvider._internal(
      (ref) => create(ref as DefaultAccountIconRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      currencyInteractor: currencyInteractor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DefaultAccountIconProvider &&
        other.currencyInteractor == currencyInteractor;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currencyInteractor.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DefaultAccountIconRef
    on AutoDisposeFutureProviderRef<AssetIconTableData> {
  /// The parameter `currencyInteractor` of this provider.
  AssetIconInteractor? get currencyInteractor;
}

class _DefaultAccountIconProviderElement
    extends AutoDisposeFutureProviderElement<AssetIconTableData>
    with DefaultAccountIconRef {
  _DefaultAccountIconProviderElement(super.provider);

  @override
  AssetIconInteractor? get currencyInteractor =>
      (origin as DefaultAccountIconProvider).currencyInteractor;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
