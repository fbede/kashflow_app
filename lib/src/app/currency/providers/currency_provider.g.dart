// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savedCurrenciesHash() => r'f263add2dbe0a6aef16c4ef5218ddb057b62a547';

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

/// See also [savedCurrencies].
@ProviderFor(savedCurrencies)
const savedCurrenciesPresenter = SavedCurrenciesFamily();

/// See also [savedCurrencies].
class SavedCurrenciesFamily extends Family {
  /// See also [savedCurrencies].
  const SavedCurrenciesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'savedCurrenciesPresenter';

  /// See also [savedCurrencies].
  SavedCurrenciesProvider call(
    String searchTerm, {
    CurrencyInteractor? currencyInteractor,
  }) {
    return SavedCurrenciesProvider(
      searchTerm,
      currencyInteractor: currencyInteractor,
    );
  }

  @visibleForOverriding
  @override
  SavedCurrenciesProvider getProviderOverride(
    covariant SavedCurrenciesProvider provider,
  ) {
    return call(
      provider.searchTerm,
      currencyInteractor: provider.currencyInteractor,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Stream<List<CurrencyTableData>> Function(SavedCurrenciesRef ref) create) {
    return _$SavedCurrenciesFamilyOverride(this, create);
  }
}

class _$SavedCurrenciesFamilyOverride implements FamilyOverride {
  _$SavedCurrenciesFamilyOverride(this.overriddenFamily, this.create);

  final Stream<List<CurrencyTableData>> Function(SavedCurrenciesRef ref) create;

  @override
  final SavedCurrenciesFamily overriddenFamily;

  @override
  SavedCurrenciesProvider getProviderOverride(
    covariant SavedCurrenciesProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [savedCurrencies].
class SavedCurrenciesProvider
    extends AutoDisposeStreamProvider<List<CurrencyTableData>> {
  /// See also [savedCurrencies].
  SavedCurrenciesProvider(
    String searchTerm, {
    CurrencyInteractor? currencyInteractor,
  }) : this._internal(
          (ref) => savedCurrencies(
            ref as SavedCurrenciesRef,
            searchTerm,
            currencyInteractor: currencyInteractor,
          ),
          from: savedCurrenciesPresenter,
          name: r'savedCurrenciesPresenter',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$savedCurrenciesHash,
          dependencies: SavedCurrenciesFamily._dependencies,
          allTransitiveDependencies:
              SavedCurrenciesFamily._allTransitiveDependencies,
          searchTerm: searchTerm,
          currencyInteractor: currencyInteractor,
        );

  SavedCurrenciesProvider._internal(
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
  final CurrencyInteractor? currencyInteractor;

  @override
  Override overrideWith(
    Stream<List<CurrencyTableData>> Function(SavedCurrenciesRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SavedCurrenciesProvider._internal(
        (ref) => create(ref as SavedCurrenciesRef),
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
    CurrencyInteractor? currencyInteractor,
  }) get argument {
    return (
      searchTerm,
      currencyInteractor: currencyInteractor,
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<CurrencyTableData>> createElement() {
    return _SavedCurrenciesProviderElement(this);
  }

  SavedCurrenciesProvider _copyWith(
    Stream<List<CurrencyTableData>> Function(SavedCurrenciesRef ref) create,
  ) {
    return SavedCurrenciesProvider._internal(
      (ref) => create(ref as SavedCurrenciesRef),
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
    return other is SavedCurrenciesProvider &&
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

mixin SavedCurrenciesRef
    on AutoDisposeStreamProviderRef<List<CurrencyTableData>> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;

  /// The parameter `currencyInteractor` of this provider.
  CurrencyInteractor? get currencyInteractor;
}

class _SavedCurrenciesProviderElement
    extends AutoDisposeStreamProviderElement<List<CurrencyTableData>>
    with SavedCurrenciesRef {
  _SavedCurrenciesProviderElement(super.provider);

  @override
  String get searchTerm => (origin as SavedCurrenciesProvider).searchTerm;
  @override
  CurrencyInteractor? get currencyInteractor =>
      (origin as SavedCurrenciesProvider).currencyInteractor;
}

String _$otherCurrenciesHash() => r'a6529d7d05b8d490cc24118e04eb0faef84674c5';

/// See also [otherCurrencies].
@ProviderFor(otherCurrencies)
const otherCurrenciesPresenter = OtherCurrenciesFamily();

/// See also [otherCurrencies].
class OtherCurrenciesFamily extends Family {
  /// See also [otherCurrencies].
  const OtherCurrenciesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'otherCurrenciesPresenter';

  /// See also [otherCurrencies].
  OtherCurrenciesProvider call(
    String searchTerm, {
    CurrencyInteractor? currencyInteractor,
  }) {
    return OtherCurrenciesProvider(
      searchTerm,
      currencyInteractor: currencyInteractor,
    );
  }

  @visibleForOverriding
  @override
  OtherCurrenciesProvider getProviderOverride(
    covariant OtherCurrenciesProvider provider,
  ) {
    return call(
      provider.searchTerm,
      currencyInteractor: provider.currencyInteractor,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      List<Currency> Function(OtherCurrenciesRef ref) create) {
    return _$OtherCurrenciesFamilyOverride(this, create);
  }
}

class _$OtherCurrenciesFamilyOverride implements FamilyOverride {
  _$OtherCurrenciesFamilyOverride(this.overriddenFamily, this.create);

  final List<Currency> Function(OtherCurrenciesRef ref) create;

  @override
  final OtherCurrenciesFamily overriddenFamily;

  @override
  OtherCurrenciesProvider getProviderOverride(
    covariant OtherCurrenciesProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [otherCurrencies].
class OtherCurrenciesProvider extends AutoDisposeProvider<List<Currency>> {
  /// See also [otherCurrencies].
  OtherCurrenciesProvider(
    String searchTerm, {
    CurrencyInteractor? currencyInteractor,
  }) : this._internal(
          (ref) => otherCurrencies(
            ref as OtherCurrenciesRef,
            searchTerm,
            currencyInteractor: currencyInteractor,
          ),
          from: otherCurrenciesPresenter,
          name: r'otherCurrenciesPresenter',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$otherCurrenciesHash,
          dependencies: OtherCurrenciesFamily._dependencies,
          allTransitiveDependencies:
              OtherCurrenciesFamily._allTransitiveDependencies,
          searchTerm: searchTerm,
          currencyInteractor: currencyInteractor,
        );

  OtherCurrenciesProvider._internal(
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
  final CurrencyInteractor? currencyInteractor;

  @override
  Override overrideWith(
    List<Currency> Function(OtherCurrenciesRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OtherCurrenciesProvider._internal(
        (ref) => create(ref as OtherCurrenciesRef),
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
    CurrencyInteractor? currencyInteractor,
  }) get argument {
    return (
      searchTerm,
      currencyInteractor: currencyInteractor,
    );
  }

  @override
  AutoDisposeProviderElement<List<Currency>> createElement() {
    return _OtherCurrenciesProviderElement(this);
  }

  OtherCurrenciesProvider _copyWith(
    List<Currency> Function(OtherCurrenciesRef ref) create,
  ) {
    return OtherCurrenciesProvider._internal(
      (ref) => create(ref as OtherCurrenciesRef),
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
    return other is OtherCurrenciesProvider &&
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

mixin OtherCurrenciesRef on AutoDisposeProviderRef<List<Currency>> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;

  /// The parameter `currencyInteractor` of this provider.
  CurrencyInteractor? get currencyInteractor;
}

class _OtherCurrenciesProviderElement
    extends AutoDisposeProviderElement<List<Currency>> with OtherCurrenciesRef {
  _OtherCurrenciesProviderElement(super.provider);

  @override
  String get searchTerm => (origin as OtherCurrenciesProvider).searchTerm;
  @override
  CurrencyInteractor? get currencyInteractor =>
      (origin as OtherCurrenciesProvider).currencyInteractor;
}

String _$defaultCurrencyProviderHash() =>
    r'6b6f54fb6cc7546543cd2410517359bffc913ded';

/// See also [DefaultCurrencyProvider].
@ProviderFor(DefaultCurrencyProvider)
final defaultCurrencyProviderPresenter = AutoDisposeAsyncNotifierProvider<
    DefaultCurrencyProvider, CurrencyTableData?>.internal(
  DefaultCurrencyProvider.new,
  name: r'defaultCurrencyProviderPresenter',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultCurrencyProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DefaultCurrencyProvider
    = AutoDisposeAsyncNotifier<CurrencyTableData?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
