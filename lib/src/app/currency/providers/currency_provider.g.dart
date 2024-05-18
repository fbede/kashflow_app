// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savedCurrenciesProviderHash() =>
    r'b083cb16430be863532629fbbe9273d3bcf064f5';

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

/// See also [savedCurrenciesProvider].
@ProviderFor(savedCurrenciesProvider)
const savedCurrenciesProvider = SavedCurrenciesProviderFamily();

/// See also [savedCurrenciesProvider].
class SavedCurrenciesProviderFamily
    extends Family<AsyncValue<List<CurrencyData>>> {
  /// See also [savedCurrenciesProvider].
  const SavedCurrenciesProviderFamily();

  /// See also [savedCurrenciesProvider].
  SavedCurrenciesProviderProvider call(
    String searchTerm, {
    LocalCurrencyInteractor? currencyInteractor,
  }) {
    return SavedCurrenciesProviderProvider(
      searchTerm,
      currencyInteractor: currencyInteractor,
    );
  }

  @override
  SavedCurrenciesProviderProvider getProviderOverride(
    covariant SavedCurrenciesProviderProvider provider,
  ) {
    return call(
      provider.searchTerm,
      currencyInteractor: provider.currencyInteractor,
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

/// See also [savedCurrenciesProvider].
class SavedCurrenciesProviderProvider
    extends AutoDisposeStreamProvider<List<CurrencyData>> {
  /// See also [savedCurrenciesProvider].
  SavedCurrenciesProviderProvider(
    String searchTerm, {
    LocalCurrencyInteractor? currencyInteractor,
  }) : this._internal(
          (ref) => savedCurrenciesProvider(
            ref as SavedCurrenciesProviderRef,
            searchTerm,
            currencyInteractor: currencyInteractor,
          ),
          from: savedCurrenciesProvider,
          name: r'savedCurrenciesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$savedCurrenciesProviderHash,
          dependencies: SavedCurrenciesProviderFamily._dependencies,
          allTransitiveDependencies:
              SavedCurrenciesProviderFamily._allTransitiveDependencies,
          searchTerm: searchTerm,
          currencyInteractor: currencyInteractor,
        );

  SavedCurrenciesProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchTerm,
    required this.currencyInteractor,
  }) : super.internal();

  final String searchTerm;
  final LocalCurrencyInteractor? currencyInteractor;

  @override
  Override overrideWith(
    Stream<List<CurrencyData>> Function(SavedCurrenciesProviderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SavedCurrenciesProviderProvider._internal(
        (ref) => create(ref as SavedCurrenciesProviderRef),
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
  AutoDisposeStreamProviderElement<List<CurrencyData>> createElement() {
    return _SavedCurrenciesProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SavedCurrenciesProviderProvider &&
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

mixin SavedCurrenciesProviderRef
    on AutoDisposeStreamProviderRef<List<CurrencyData>> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;

  /// The parameter `currencyInteractor` of this provider.
  LocalCurrencyInteractor? get currencyInteractor;
}

class _SavedCurrenciesProviderProviderElement
    extends AutoDisposeStreamProviderElement<List<CurrencyData>>
    with SavedCurrenciesProviderRef {
  _SavedCurrenciesProviderProviderElement(super.provider);

  @override
  String get searchTerm =>
      (origin as SavedCurrenciesProviderProvider).searchTerm;
  @override
  LocalCurrencyInteractor? get currencyInteractor =>
      (origin as SavedCurrenciesProviderProvider).currencyInteractor;
}

String _$otherCurrenciesProviderHash() =>
    r'1c2b53c8758bdfb4c04889003a69b6614ce76e05';

/// See also [otherCurrenciesProvider].
@ProviderFor(otherCurrenciesProvider)
const otherCurrenciesProvider = OtherCurrenciesProviderFamily();

/// See also [otherCurrenciesProvider].
class OtherCurrenciesProviderFamily extends Family<List<money2.Currency>> {
  /// See also [otherCurrenciesProvider].
  const OtherCurrenciesProviderFamily();

  /// See also [otherCurrenciesProvider].
  OtherCurrenciesProviderProvider call(
    String searchTerm, {
    LocalCurrencyInteractor? currencyInteractor,
  }) {
    return OtherCurrenciesProviderProvider(
      searchTerm,
      currencyInteractor: currencyInteractor,
    );
  }

  @override
  OtherCurrenciesProviderProvider getProviderOverride(
    covariant OtherCurrenciesProviderProvider provider,
  ) {
    return call(
      provider.searchTerm,
      currencyInteractor: provider.currencyInteractor,
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

/// See also [otherCurrenciesProvider].
class OtherCurrenciesProviderProvider
    extends AutoDisposeProvider<List<money2.Currency>> {
  /// See also [otherCurrenciesProvider].
  OtherCurrenciesProviderProvider(
    String searchTerm, {
    LocalCurrencyInteractor? currencyInteractor,
  }) : this._internal(
          (ref) => otherCurrenciesProvider(
            ref as OtherCurrenciesProviderRef,
            searchTerm,
            currencyInteractor: currencyInteractor,
          ),
          from: otherCurrenciesProvider,
          name: r'otherCurrenciesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$otherCurrenciesProviderHash,
          dependencies: OtherCurrenciesProviderFamily._dependencies,
          allTransitiveDependencies:
              OtherCurrenciesProviderFamily._allTransitiveDependencies,
          searchTerm: searchTerm,
          currencyInteractor: currencyInteractor,
        );

  OtherCurrenciesProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchTerm,
    required this.currencyInteractor,
  }) : super.internal();

  final String searchTerm;
  final LocalCurrencyInteractor? currencyInteractor;

  @override
  Override overrideWith(
    List<money2.Currency> Function(OtherCurrenciesProviderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OtherCurrenciesProviderProvider._internal(
        (ref) => create(ref as OtherCurrenciesProviderRef),
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
  AutoDisposeProviderElement<List<money2.Currency>> createElement() {
    return _OtherCurrenciesProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OtherCurrenciesProviderProvider &&
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

mixin OtherCurrenciesProviderRef
    on AutoDisposeProviderRef<List<money2.Currency>> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;

  /// The parameter `currencyInteractor` of this provider.
  LocalCurrencyInteractor? get currencyInteractor;
}

class _OtherCurrenciesProviderProviderElement
    extends AutoDisposeProviderElement<List<money2.Currency>>
    with OtherCurrenciesProviderRef {
  _OtherCurrenciesProviderProviderElement(super.provider);

  @override
  String get searchTerm =>
      (origin as OtherCurrenciesProviderProvider).searchTerm;
  @override
  LocalCurrencyInteractor? get currencyInteractor =>
      (origin as OtherCurrenciesProviderProvider).currencyInteractor;
}

String _$defaultCurrencyProviderHash() =>
    r'7d4db737c7f61d464b195cf03dc9015baf1d9cd6';

abstract class _$DefaultCurrencyProvider
    extends BuildlessAutoDisposeAsyncNotifier<CurrencyData?> {
  late final LocalCurrencyInteractor? interactor;

  FutureOr<CurrencyData?> build({
    LocalCurrencyInteractor? interactor,
  });
}

/// See also [DefaultCurrencyProvider].
@ProviderFor(DefaultCurrencyProvider)
const defaultCurrencyProvider = DefaultCurrencyProviderFamily();

/// See also [DefaultCurrencyProvider].
class DefaultCurrencyProviderFamily extends Family<AsyncValue<CurrencyData?>> {
  /// See also [DefaultCurrencyProvider].
  const DefaultCurrencyProviderFamily();

  /// See also [DefaultCurrencyProvider].
  DefaultCurrencyProviderProvider call({
    LocalCurrencyInteractor? interactor,
  }) {
    return DefaultCurrencyProviderProvider(
      interactor: interactor,
    );
  }

  @override
  DefaultCurrencyProviderProvider getProviderOverride(
    covariant DefaultCurrencyProviderProvider provider,
  ) {
    return call(
      interactor: provider.interactor,
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
  String? get name => r'defaultCurrencyProvider';
}

/// See also [DefaultCurrencyProvider].
class DefaultCurrencyProviderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DefaultCurrencyProvider,
        CurrencyData?> {
  /// See also [DefaultCurrencyProvider].
  DefaultCurrencyProviderProvider({
    LocalCurrencyInteractor? interactor,
  }) : this._internal(
          () => DefaultCurrencyProvider()..interactor = interactor,
          from: defaultCurrencyProvider,
          name: r'defaultCurrencyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$defaultCurrencyProviderHash,
          dependencies: DefaultCurrencyProviderFamily._dependencies,
          allTransitiveDependencies:
              DefaultCurrencyProviderFamily._allTransitiveDependencies,
          interactor: interactor,
        );

  DefaultCurrencyProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.interactor,
  }) : super.internal();

  final LocalCurrencyInteractor? interactor;

  @override
  FutureOr<CurrencyData?> runNotifierBuild(
    covariant DefaultCurrencyProvider notifier,
  ) {
    return notifier.build(
      interactor: interactor,
    );
  }

  @override
  Override overrideWith(DefaultCurrencyProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: DefaultCurrencyProviderProvider._internal(
        () => create()..interactor = interactor,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        interactor: interactor,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DefaultCurrencyProvider,
      CurrencyData?> createElement() {
    return _DefaultCurrencyProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DefaultCurrencyProviderProvider &&
        other.interactor == interactor;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, interactor.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DefaultCurrencyProviderRef
    on AutoDisposeAsyncNotifierProviderRef<CurrencyData?> {
  /// The parameter `interactor` of this provider.
  LocalCurrencyInteractor? get interactor;
}

class _DefaultCurrencyProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DefaultCurrencyProvider,
        CurrencyData?> with DefaultCurrencyProviderRef {
  _DefaultCurrencyProviderProviderElement(super.provider);

  @override
  LocalCurrencyInteractor? get interactor =>
      (origin as DefaultCurrencyProviderProvider).interactor;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
