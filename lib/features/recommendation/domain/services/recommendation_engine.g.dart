// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_engine.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recommendationEngineHash() =>
    r'691ce6a6834ed554930105da6022674141b40d69';

/// See also [recommendationEngine].
@ProviderFor(recommendationEngine)
final recommendationEngineProvider =
    AutoDisposeFutureProvider<RecommendationEngine>.internal(
  recommendationEngine,
  name: r'recommendationEngineProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recommendationEngineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RecommendationEngineRef
    = AutoDisposeFutureProviderRef<RecommendationEngine>;
String _$recommendedDestinationsHash() =>
    r'e08080b735802b1323f8517f5b0eaf165b94b92a';

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

/// See also [recommendedDestinations].
@ProviderFor(recommendedDestinations)
const recommendedDestinationsProvider = RecommendedDestinationsFamily();

/// See also [recommendedDestinations].
class RecommendedDestinationsFamily
    extends Family<AsyncValue<List<Destination>>> {
  /// See also [recommendedDestinations].
  const RecommendedDestinationsFamily();

  /// See also [recommendedDestinations].
  RecommendedDestinationsProvider call(
    UserPreferences prefs,
  ) {
    return RecommendedDestinationsProvider(
      prefs,
    );
  }

  @override
  RecommendedDestinationsProvider getProviderOverride(
    covariant RecommendedDestinationsProvider provider,
  ) {
    return call(
      provider.prefs,
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
  String? get name => r'recommendedDestinationsProvider';
}

/// See also [recommendedDestinations].
class RecommendedDestinationsProvider
    extends AutoDisposeFutureProvider<List<Destination>> {
  /// See also [recommendedDestinations].
  RecommendedDestinationsProvider(
    UserPreferences prefs,
  ) : this._internal(
          (ref) => recommendedDestinations(
            ref as RecommendedDestinationsRef,
            prefs,
          ),
          from: recommendedDestinationsProvider,
          name: r'recommendedDestinationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recommendedDestinationsHash,
          dependencies: RecommendedDestinationsFamily._dependencies,
          allTransitiveDependencies:
              RecommendedDestinationsFamily._allTransitiveDependencies,
          prefs: prefs,
        );

  RecommendedDestinationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.prefs,
  }) : super.internal();

  final UserPreferences prefs;

  @override
  Override overrideWith(
    FutureOr<List<Destination>> Function(RecommendedDestinationsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecommendedDestinationsProvider._internal(
        (ref) => create(ref as RecommendedDestinationsRef),
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
  AutoDisposeFutureProviderElement<List<Destination>> createElement() {
    return _RecommendedDestinationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecommendedDestinationsProvider && other.prefs == prefs;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, prefs.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecommendedDestinationsRef
    on AutoDisposeFutureProviderRef<List<Destination>> {
  /// The parameter `prefs` of this provider.
  UserPreferences get prefs;
}

class _RecommendedDestinationsProviderElement
    extends AutoDisposeFutureProviderElement<List<Destination>>
    with RecommendedDestinationsRef {
  _RecommendedDestinationsProviderElement(super.provider);

  @override
  UserPreferences get prefs =>
      (origin as RecommendedDestinationsProvider).prefs;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
