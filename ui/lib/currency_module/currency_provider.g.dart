// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savedCurrenciesHash() => r'd6b38ee01649014f4781792a9ccda90ddae989e9';

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
const savedCurrenciesProvider = SavedCurrenciesFamily();

/// See also [savedCurrencies].
class SavedCurrenciesFamily extends Family<AsyncValue<List<Currency>>> {
  /// See also [savedCurrencies].
  const SavedCurrenciesFamily();

  /// See also [savedCurrencies].
  SavedCurrenciesProvider call(
    String searchTerm,
  ) {
    return SavedCurrenciesProvider(
      searchTerm,
    );
  }

  @override
  SavedCurrenciesProvider getProviderOverride(
    covariant SavedCurrenciesProvider provider,
  ) {
    return call(
      provider.searchTerm,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'savedCurrenciesProvider';
}

/// See also [savedCurrencies].
class SavedCurrenciesProvider
    extends AutoDisposeStreamProvider<List<Currency>> {
  /// See also [savedCurrencies].
  SavedCurrenciesProvider(
    String searchTerm,
  ) : this._internal(
          (ref) => savedCurrencies(
            ref as SavedCurrenciesRef,
            searchTerm,
          ),
          from: savedCurrenciesProvider,
          name: r'savedCurrenciesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$savedCurrenciesHash,
          dependencies: SavedCurrenciesFamily._dependencies,
          allTransitiveDependencies:
              SavedCurrenciesFamily._allTransitiveDependencies,
          searchTerm: searchTerm,
        );

  SavedCurrenciesProvider._internal(
    super._createNotifier, {
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
    Stream<List<Currency>> Function(SavedCurrenciesRef provider) create,
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
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Currency>> createElement() {
    return _SavedCurrenciesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SavedCurrenciesProvider && other.searchTerm == searchTerm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchTerm.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SavedCurrenciesRef on AutoDisposeStreamProviderRef<List<Currency>> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;
}

class _SavedCurrenciesProviderElement
    extends AutoDisposeStreamProviderElement<List<Currency>>
    with SavedCurrenciesRef {
  _SavedCurrenciesProviderElement(super.provider);

  @override
  String get searchTerm => (origin as SavedCurrenciesProvider).searchTerm;
}

String _$otherCurrenciesHash() => r'804ed92d736a93072687e87e28f46a32242c0656';

/// See also [otherCurrencies].
@ProviderFor(otherCurrencies)
const otherCurrenciesProvider = OtherCurrenciesFamily();

/// See also [otherCurrencies].
class OtherCurrenciesFamily extends Family<AsyncValue<List<Currency>>> {
  /// See also [otherCurrencies].
  const OtherCurrenciesFamily();

  /// See also [otherCurrencies].
  OtherCurrenciesProvider call(
    String searchTerm,
  ) {
    return OtherCurrenciesProvider(
      searchTerm,
    );
  }

  @override
  OtherCurrenciesProvider getProviderOverride(
    covariant OtherCurrenciesProvider provider,
  ) {
    return call(
      provider.searchTerm,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'otherCurrenciesProvider';
}

/// See also [otherCurrencies].
class OtherCurrenciesProvider
    extends AutoDisposeStreamProvider<List<Currency>> {
  /// See also [otherCurrencies].
  OtherCurrenciesProvider(
    String searchTerm,
  ) : this._internal(
          (ref) => otherCurrencies(
            ref as OtherCurrenciesRef,
            searchTerm,
          ),
          from: otherCurrenciesProvider,
          name: r'otherCurrenciesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$otherCurrenciesHash,
          dependencies: OtherCurrenciesFamily._dependencies,
          allTransitiveDependencies:
              OtherCurrenciesFamily._allTransitiveDependencies,
          searchTerm: searchTerm,
        );

  OtherCurrenciesProvider._internal(
    super._createNotifier, {
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
    Stream<List<Currency>> Function(OtherCurrenciesRef provider) create,
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
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Currency>> createElement() {
    return _OtherCurrenciesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OtherCurrenciesProvider && other.searchTerm == searchTerm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchTerm.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OtherCurrenciesRef on AutoDisposeStreamProviderRef<List<Currency>> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;
}

class _OtherCurrenciesProviderElement
    extends AutoDisposeStreamProviderElement<List<Currency>>
    with OtherCurrenciesRef {
  _OtherCurrenciesProviderElement(super.provider);

  @override
  String get searchTerm => (origin as OtherCurrenciesProvider).searchTerm;
}

String _$defaultCurrencyHash() => r'237c81c61ae1c56685bba3310c99e381c4f6c756';

/// See also [DefaultCurrency].
@ProviderFor(DefaultCurrency)
final defaultCurrencyProvider =
    AutoDisposeAsyncNotifierProvider<DefaultCurrency, Currency>.internal(
  DefaultCurrency.new,
  name: r'defaultCurrencyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultCurrencyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DefaultCurrency = AutoDisposeAsyncNotifier<Currency>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
