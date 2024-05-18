// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_picker_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$iconPickerProviderHash() =>
    r'd72c4c219dccfd0f7484b0a07accd503f8f9771a';

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

abstract class _$IconPickerProvider
    extends BuildlessAutoDisposeNotifier<List<IconData>> {
  late final String searchTerm;

  List<IconData> build(
    String searchTerm,
  );
}

/// See also [IconPickerProvider].
@ProviderFor(IconPickerProvider)
const iconPickerProvider = IconPickerProviderFamily();

/// See also [IconPickerProvider].
class IconPickerProviderFamily extends Family<List<IconData>> {
  /// See also [IconPickerProvider].
  const IconPickerProviderFamily();

  /// See also [IconPickerProvider].
  IconPickerProviderProvider call(
    String searchTerm,
  ) {
    return IconPickerProviderProvider(
      searchTerm,
    );
  }

  @override
  IconPickerProviderProvider getProviderOverride(
    covariant IconPickerProviderProvider provider,
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
  String? get name => r'iconPickerProvider';
}

/// See also [IconPickerProvider].
class IconPickerProviderProvider extends AutoDisposeNotifierProviderImpl<
    IconPickerProvider, List<IconData>> {
  /// See also [IconPickerProvider].
  IconPickerProviderProvider(
    String searchTerm,
  ) : this._internal(
          () => IconPickerProvider()..searchTerm = searchTerm,
          from: iconPickerProvider,
          name: r'iconPickerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$iconPickerProviderHash,
          dependencies: IconPickerProviderFamily._dependencies,
          allTransitiveDependencies:
              IconPickerProviderFamily._allTransitiveDependencies,
          searchTerm: searchTerm,
        );

  IconPickerProviderProvider._internal(
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
  List<IconData> runNotifierBuild(
    covariant IconPickerProvider notifier,
  ) {
    return notifier.build(
      searchTerm,
    );
  }

  @override
  Override overrideWith(IconPickerProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: IconPickerProviderProvider._internal(
        () => create()..searchTerm = searchTerm,
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
  AutoDisposeNotifierProviderElement<IconPickerProvider, List<IconData>>
      createElement() {
    return _IconPickerProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IconPickerProviderProvider &&
        other.searchTerm == searchTerm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchTerm.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IconPickerProviderRef on AutoDisposeNotifierProviderRef<List<IconData>> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;
}

class _IconPickerProviderProviderElement
    extends AutoDisposeNotifierProviderElement<IconPickerProvider,
        List<IconData>> with IconPickerProviderRef {
  _IconPickerProviderProviderElement(super.provider);

  @override
  String get searchTerm => (origin as IconPickerProviderProvider).searchTerm;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
