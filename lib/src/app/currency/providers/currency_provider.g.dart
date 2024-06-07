// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currencyHash() => r'81bbd40a936a33a3d9e52b51900c6a90ec3e8dad';

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

/// See also [currency].
@ProviderFor(currency)
const currencyProvider = CurrencyFamily();

/// See also [currency].
class CurrencyFamily extends Family {
  /// See also [currency].
  const CurrencyFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'currencyProvider';

  /// See also [currency].
  CurrencyProvider call(
    String searchTerm,
  ) {
    return CurrencyProvider(
      searchTerm,
    );
  }

  @visibleForOverriding
  @override
  CurrencyProvider getProviderOverride(
    covariant CurrencyProvider provider,
  ) {
    return call(
      provider.searchTerm,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<List<CurrencyTableData>> Function(CurrencyRef ref) create) {
    return _$CurrencyFamilyOverride(this, create);
  }
}

class _$CurrencyFamilyOverride implements FamilyOverride {
  _$CurrencyFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<List<CurrencyTableData>> Function(CurrencyRef ref) create;

  @override
  final CurrencyFamily overriddenFamily;

  @override
  CurrencyProvider getProviderOverride(
    covariant CurrencyProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [currency].
class CurrencyProvider
    extends AutoDisposeFutureProvider<List<CurrencyTableData>> {
  /// See also [currency].
  CurrencyProvider(
    String searchTerm,
  ) : this._internal(
          (ref) => currency(
            ref as CurrencyRef,
            searchTerm,
          ),
          from: currencyProvider,
          name: r'currencyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currencyHash,
          dependencies: CurrencyFamily._dependencies,
          allTransitiveDependencies: CurrencyFamily._allTransitiveDependencies,
          searchTerm: searchTerm,
        );

  CurrencyProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchTerm,
  }) : super.internal();

  final String searchTerm;

  @override
  Override overrideWith(
    FutureOr<List<CurrencyTableData>> Function(CurrencyRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CurrencyProvider._internal(
        (ref) => create(ref as CurrencyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchTerm: searchTerm,
      ),
    );
  }

  @override
  (String,) get argument {
    return (searchTerm,);
  }

  @override
  AutoDisposeFutureProviderElement<List<CurrencyTableData>> createElement() {
    return _CurrencyProviderElement(this);
  }

  CurrencyProvider _copyWith(
    FutureOr<List<CurrencyTableData>> Function(CurrencyRef ref) create,
  ) {
    return CurrencyProvider._internal(
      (ref) => create(ref as CurrencyRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      searchTerm: searchTerm,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CurrencyProvider && other.searchTerm == searchTerm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchTerm.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrencyRef on AutoDisposeFutureProviderRef<List<CurrencyTableData>> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;
}

class _CurrencyProviderElement
    extends AutoDisposeFutureProviderElement<List<CurrencyTableData>>
    with CurrencyRef {
  _CurrencyProviderElement(super.provider);

  @override
  String get searchTerm => (origin as CurrencyProvider).searchTerm;
}

String _$defaultCurrencyScreenHash() =>
    r'5df0b6e535c4f573dc3de62631c43e244d918510';

/// See also [defaultCurrencyScreen].
@ProviderFor(defaultCurrencyScreen)
const defaultCurrencyScreenProvider = DefaultCurrencyScreenFamily();

/// See also [defaultCurrencyScreen].
class DefaultCurrencyScreenFamily extends Family {
  /// See also [defaultCurrencyScreen].
  const DefaultCurrencyScreenFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'defaultCurrencyScreenProvider';

  /// See also [defaultCurrencyScreen].
  DefaultCurrencyScreenProvider call(
    String searchTerm,
  ) {
    return DefaultCurrencyScreenProvider(
      searchTerm,
    );
  }

  @visibleForOverriding
  @override
  DefaultCurrencyScreenProvider getProviderOverride(
    covariant DefaultCurrencyScreenProvider provider,
  ) {
    return call(
      provider.searchTerm,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<(CurrencyTableData?, List<CurrencyTableData>)> Function(
              DefaultCurrencyScreenRef ref)
          create) {
    return _$DefaultCurrencyScreenFamilyOverride(this, create);
  }
}

class _$DefaultCurrencyScreenFamilyOverride implements FamilyOverride {
  _$DefaultCurrencyScreenFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<(CurrencyTableData?, List<CurrencyTableData>)> Function(
      DefaultCurrencyScreenRef ref) create;

  @override
  final DefaultCurrencyScreenFamily overriddenFamily;

  @override
  DefaultCurrencyScreenProvider getProviderOverride(
    covariant DefaultCurrencyScreenProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [defaultCurrencyScreen].
class DefaultCurrencyScreenProvider extends AutoDisposeFutureProvider<
    (CurrencyTableData?, List<CurrencyTableData>)> {
  /// See also [defaultCurrencyScreen].
  DefaultCurrencyScreenProvider(
    String searchTerm,
  ) : this._internal(
          (ref) => defaultCurrencyScreen(
            ref as DefaultCurrencyScreenRef,
            searchTerm,
          ),
          from: defaultCurrencyScreenProvider,
          name: r'defaultCurrencyScreenProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$defaultCurrencyScreenHash,
          dependencies: DefaultCurrencyScreenFamily._dependencies,
          allTransitiveDependencies:
              DefaultCurrencyScreenFamily._allTransitiveDependencies,
          searchTerm: searchTerm,
        );

  DefaultCurrencyScreenProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchTerm,
  }) : super.internal();

  final String searchTerm;

  @override
  Override overrideWith(
    FutureOr<(CurrencyTableData?, List<CurrencyTableData>)> Function(
            DefaultCurrencyScreenRef ref)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DefaultCurrencyScreenProvider._internal(
        (ref) => create(ref as DefaultCurrencyScreenRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchTerm: searchTerm,
      ),
    );
  }

  @override
  (String,) get argument {
    return (searchTerm,);
  }

  @override
  AutoDisposeFutureProviderElement<
      (CurrencyTableData?, List<CurrencyTableData>)> createElement() {
    return _DefaultCurrencyScreenProviderElement(this);
  }

  DefaultCurrencyScreenProvider _copyWith(
    FutureOr<(CurrencyTableData?, List<CurrencyTableData>)> Function(
            DefaultCurrencyScreenRef ref)
        create,
  ) {
    return DefaultCurrencyScreenProvider._internal(
      (ref) => create(ref as DefaultCurrencyScreenRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      searchTerm: searchTerm,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DefaultCurrencyScreenProvider &&
        other.searchTerm == searchTerm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchTerm.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DefaultCurrencyScreenRef on AutoDisposeFutureProviderRef<
    (CurrencyTableData?, List<CurrencyTableData>)> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;
}

class _DefaultCurrencyScreenProviderElement
    extends AutoDisposeFutureProviderElement<
        (CurrencyTableData?, List<CurrencyTableData>)>
    with DefaultCurrencyScreenRef {
  _DefaultCurrencyScreenProviderElement(super.provider);

  @override
  String get searchTerm => (origin as DefaultCurrencyScreenProvider).searchTerm;
}

String _$defaultCurrencyHash() => r'631fe46beba9ccba4f9d7e776662c25b8dcbf82d';

/// See also [DefaultCurrency].
@ProviderFor(DefaultCurrency)
final defaultCurrencyProvider = AutoDisposeAsyncNotifierProvider<
    DefaultCurrency, CurrencyTableData?>.internal(
  DefaultCurrency.new,
  name: r'defaultCurrencyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultCurrencyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DefaultCurrency = AutoDisposeAsyncNotifier<CurrencyTableData?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
