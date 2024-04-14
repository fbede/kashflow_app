// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_picker_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$iconPickerHash() => r'a162696ec579e09882960e81108f2b21fbf88d17';

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

abstract class _$IconPicker
    extends BuildlessAutoDisposeNotifier<List<IconData>> {
  late final String searchTerm;

  List<IconData> build(
    String searchTerm,
  );
}

/// See also [IconPicker].
@ProviderFor(IconPicker)
const iconPickerProvider = IconPickerFamily();

/// See also [IconPicker].
class IconPickerFamily extends Family<List<IconData>> {
  /// See also [IconPicker].
  const IconPickerFamily();

  /// See also [IconPicker].
  IconPickerProvider call(
    String searchTerm,
  ) {
    return IconPickerProvider(
      searchTerm,
    );
  }

  @override
  IconPickerProvider getProviderOverride(
    covariant IconPickerProvider provider,
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

/// See also [IconPicker].
class IconPickerProvider
    extends AutoDisposeNotifierProviderImpl<IconPicker, List<IconData>> {
  /// See also [IconPicker].
  IconPickerProvider(
    String searchTerm,
  ) : this._internal(
          () => IconPicker()..searchTerm = searchTerm,
          from: iconPickerProvider,
          name: r'iconPickerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$iconPickerHash,
          dependencies: IconPickerFamily._dependencies,
          allTransitiveDependencies:
              IconPickerFamily._allTransitiveDependencies,
          searchTerm: searchTerm,
        );

  IconPickerProvider._internal(
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
    covariant IconPicker notifier,
  ) {
    return notifier.build(
      searchTerm,
    );
  }

  @override
  Override overrideWith(IconPicker Function() create) {
    return ProviderOverride(
      origin: this,
      override: IconPickerProvider._internal(
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
  AutoDisposeNotifierProviderElement<IconPicker, List<IconData>>
      createElement() {
    return _IconPickerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IconPickerProvider && other.searchTerm == searchTerm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchTerm.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IconPickerRef on AutoDisposeNotifierProviderRef<List<IconData>> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;
}

class _IconPickerProviderElement
    extends AutoDisposeNotifierProviderElement<IconPicker, List<IconData>>
    with IconPickerRef {
  _IconPickerProviderElement(super.provider);

  @override
  String get searchTerm => (origin as IconPickerProvider).searchTerm;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
