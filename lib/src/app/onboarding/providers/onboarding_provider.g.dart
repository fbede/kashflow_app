// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onboardingProviderHash() =>
    r'1c74ed9b5a2cfcd65f5d864578b05a9fad3d6248';

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

abstract class _$OnboardingProvider extends BuildlessAutoDisposeNotifier<bool> {
  late final SharedPreferences prefs;

  bool build({
    required SharedPreferences prefs,
  });
}

/// See also [OnboardingProvider].
@ProviderFor(OnboardingProvider)
const onboardingProvider = OnboardingProviderFamily();

/// See also [OnboardingProvider].
class OnboardingProviderFamily extends Family<bool> {
  /// See also [OnboardingProvider].
  const OnboardingProviderFamily();

  /// See also [OnboardingProvider].
  OnboardingProviderProvider call({
    required SharedPreferences prefs,
  }) {
    return OnboardingProviderProvider(
      prefs: prefs,
    );
  }

  @override
  OnboardingProviderProvider getProviderOverride(
    covariant OnboardingProviderProvider provider,
  ) {
    return call(
      prefs: provider.prefs,
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
  String? get name => r'onboardingProvider';
}

/// See also [OnboardingProvider].
class OnboardingProviderProvider
    extends AutoDisposeNotifierProviderImpl<OnboardingProvider, bool> {
  /// See also [OnboardingProvider].
  OnboardingProviderProvider({
    required SharedPreferences prefs,
  }) : this._internal(
          () => OnboardingProvider()..prefs = prefs,
          from: onboardingProvider,
          name: r'onboardingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$onboardingProviderHash,
          dependencies: OnboardingProviderFamily._dependencies,
          allTransitiveDependencies:
              OnboardingProviderFamily._allTransitiveDependencies,
          prefs: prefs,
        );

  OnboardingProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.prefs,
  }) : super.internal();

  final SharedPreferences prefs;

  @override
  bool runNotifierBuild(
    covariant OnboardingProvider notifier,
  ) {
    return notifier.build(
      prefs: prefs,
    );
  }

  @override
  Override overrideWith(OnboardingProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: OnboardingProviderProvider._internal(
        () => create()..prefs = prefs,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        prefs: prefs,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<OnboardingProvider, bool> createElement() {
    return _OnboardingProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnboardingProviderProvider && other.prefs == prefs;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, prefs.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OnboardingProviderRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `prefs` of this provider.
  SharedPreferences get prefs;
}

class _OnboardingProviderProviderElement
    extends AutoDisposeNotifierProviderElement<OnboardingProvider, bool>
    with OnboardingProviderRef {
  _OnboardingProviderProviderElement(super.provider);

  @override
  SharedPreferences get prefs => (origin as OnboardingProviderProvider).prefs;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
