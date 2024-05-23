// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currencyHash() => r'b0ccee0515f2fc620ad6ae37c11c33cf301df992';

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
const currencyPresenter = CurrencyFamily();

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
  String? get name => r'currencyPresenter';

  /// See also [currency].
  CurrencyProvider call(
    String searchTerm, {
    CurrencyInteractor? currencyInteractor,
  }) {
    return CurrencyProvider(
      searchTerm,
      currencyInteractor: currencyInteractor,
    );
  }

  @visibleForOverriding
  @override
  CurrencyProvider getProviderOverride(
    covariant CurrencyProvider provider,
  ) {
    return call(
      provider.searchTerm,
      currencyInteractor: provider.currencyInteractor,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      Stream<List<CurrencyTableData>> Function(CurrencyRef ref) create) {
    return _$CurrencyFamilyOverride(this, create);
  }
}

class _$CurrencyFamilyOverride implements FamilyOverride {
  _$CurrencyFamilyOverride(this.overriddenFamily, this.create);

  final Stream<List<CurrencyTableData>> Function(CurrencyRef ref) create;

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
    extends AutoDisposeStreamProvider<List<CurrencyTableData>> {
  /// See also [currency].
  CurrencyProvider(
    String searchTerm, {
    CurrencyInteractor? currencyInteractor,
  }) : this._internal(
          (ref) => currency(
            ref as CurrencyRef,
            searchTerm,
            currencyInteractor: currencyInteractor,
          ),
          from: currencyPresenter,
          name: r'currencyPresenter',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currencyHash,
          dependencies: CurrencyFamily._dependencies,
          allTransitiveDependencies: CurrencyFamily._allTransitiveDependencies,
          searchTerm: searchTerm,
          currencyInteractor: currencyInteractor,
        );

  CurrencyProvider._internal(
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
    Stream<List<CurrencyTableData>> Function(CurrencyRef ref) create,
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
    return _CurrencyProviderElement(this);
  }

  CurrencyProvider _copyWith(
    Stream<List<CurrencyTableData>> Function(CurrencyRef ref) create,
  ) {
    return CurrencyProvider._internal(
      (ref) => create(ref as CurrencyRef),
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
    return other is CurrencyProvider &&
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

mixin CurrencyRef on AutoDisposeStreamProviderRef<List<CurrencyTableData>> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;

  /// The parameter `currencyInteractor` of this provider.
  CurrencyInteractor? get currencyInteractor;
}

class _CurrencyProviderElement
    extends AutoDisposeStreamProviderElement<List<CurrencyTableData>>
    with CurrencyRef {
  _CurrencyProviderElement(super.provider);

  @override
  String get searchTerm => (origin as CurrencyProvider).searchTerm;
  @override
  CurrencyInteractor? get currencyInteractor =>
      (origin as CurrencyProvider).currencyInteractor;
}

String _$defaultCurrencyProviderHash() =>
    r'0d157aebdeba307b807e6f89433791de8b0016c7';

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
