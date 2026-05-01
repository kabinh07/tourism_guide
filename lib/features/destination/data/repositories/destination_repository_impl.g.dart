// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$destinationRepositoryHash() =>
    r'8427f48b147fd6a77454a56c17bfed99eed81e11';

/// See also [destinationRepository].
@ProviderFor(destinationRepository)
final destinationRepositoryProvider =
    AutoDisposeProvider<IDestinationRepository>.internal(
  destinationRepository,
  name: r'destinationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$destinationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DestinationRepositoryRef
    = AutoDisposeProviderRef<IDestinationRepository>;
String _$popularDestinationsHash() =>
    r'289f9a7ce65dc4c7f7bf30b05f15e21fad6de41b';

/// See also [popularDestinations].
@ProviderFor(popularDestinations)
final popularDestinationsProvider =
    AutoDisposeFutureProvider<List<Destination>>.internal(
  popularDestinations,
  name: r'popularDestinationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$popularDestinationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PopularDestinationsRef
    = AutoDisposeFutureProviderRef<List<Destination>>;
String _$allDestinationTagsHash() =>
    r'f6c4edb3936362c0d84c393dfa7d2ffabec9c37f';

/// See also [allDestinationTags].
@ProviderFor(allDestinationTags)
final allDestinationTagsProvider =
    AutoDisposeFutureProvider<List<String>>.internal(
  allDestinationTags,
  name: r'allDestinationTagsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allDestinationTagsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllDestinationTagsRef = AutoDisposeFutureProviderRef<List<String>>;
String _$destinationByIdHash() => r'5d90879086ab87a3a8da7a8b6b608413e4697116';

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

/// See also [destinationById].
@ProviderFor(destinationById)
const destinationByIdProvider = DestinationByIdFamily();

/// See also [destinationById].
class DestinationByIdFamily extends Family<AsyncValue<Destination?>> {
  /// See also [destinationById].
  const DestinationByIdFamily();

  /// See also [destinationById].
  DestinationByIdProvider call(
    int id,
  ) {
    return DestinationByIdProvider(
      id,
    );
  }

  @override
  DestinationByIdProvider getProviderOverride(
    covariant DestinationByIdProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'destinationByIdProvider';
}

/// See also [destinationById].
class DestinationByIdProvider extends AutoDisposeFutureProvider<Destination?> {
  /// See also [destinationById].
  DestinationByIdProvider(
    int id,
  ) : this._internal(
          (ref) => destinationById(
            ref as DestinationByIdRef,
            id,
          ),
          from: destinationByIdProvider,
          name: r'destinationByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$destinationByIdHash,
          dependencies: DestinationByIdFamily._dependencies,
          allTransitiveDependencies:
              DestinationByIdFamily._allTransitiveDependencies,
          id: id,
        );

  DestinationByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Destination?> Function(DestinationByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DestinationByIdProvider._internal(
        (ref) => create(ref as DestinationByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Destination?> createElement() {
    return _DestinationByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DestinationByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DestinationByIdRef on AutoDisposeFutureProviderRef<Destination?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DestinationByIdProviderElement
    extends AutoDisposeFutureProviderElement<Destination?>
    with DestinationByIdRef {
  _DestinationByIdProviderElement(super.provider);

  @override
  int get id => (origin as DestinationByIdProvider).id;
}

String _$accommodationsForDestinationHash() =>
    r'6a1aeb183655028365b2a719deb4f24439c55be4';

/// See also [accommodationsForDestination].
@ProviderFor(accommodationsForDestination)
const accommodationsForDestinationProvider =
    AccommodationsForDestinationFamily();

/// See also [accommodationsForDestination].
class AccommodationsForDestinationFamily
    extends Family<AsyncValue<List<Accommodation>>> {
  /// See also [accommodationsForDestination].
  const AccommodationsForDestinationFamily();

  /// See also [accommodationsForDestination].
  AccommodationsForDestinationProvider call(
    int destinationId,
  ) {
    return AccommodationsForDestinationProvider(
      destinationId,
    );
  }

  @override
  AccommodationsForDestinationProvider getProviderOverride(
    covariant AccommodationsForDestinationProvider provider,
  ) {
    return call(
      provider.destinationId,
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
  String? get name => r'accommodationsForDestinationProvider';
}

/// See also [accommodationsForDestination].
class AccommodationsForDestinationProvider
    extends AutoDisposeFutureProvider<List<Accommodation>> {
  /// See also [accommodationsForDestination].
  AccommodationsForDestinationProvider(
    int destinationId,
  ) : this._internal(
          (ref) => accommodationsForDestination(
            ref as AccommodationsForDestinationRef,
            destinationId,
          ),
          from: accommodationsForDestinationProvider,
          name: r'accommodationsForDestinationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$accommodationsForDestinationHash,
          dependencies: AccommodationsForDestinationFamily._dependencies,
          allTransitiveDependencies:
              AccommodationsForDestinationFamily._allTransitiveDependencies,
          destinationId: destinationId,
        );

  AccommodationsForDestinationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.destinationId,
  }) : super.internal();

  final int destinationId;

  @override
  Override overrideWith(
    FutureOr<List<Accommodation>> Function(
            AccommodationsForDestinationRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AccommodationsForDestinationProvider._internal(
        (ref) => create(ref as AccommodationsForDestinationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        destinationId: destinationId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Accommodation>> createElement() {
    return _AccommodationsForDestinationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AccommodationsForDestinationProvider &&
        other.destinationId == destinationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, destinationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AccommodationsForDestinationRef
    on AutoDisposeFutureProviderRef<List<Accommodation>> {
  /// The parameter `destinationId` of this provider.
  int get destinationId;
}

class _AccommodationsForDestinationProviderElement
    extends AutoDisposeFutureProviderElement<List<Accommodation>>
    with AccommodationsForDestinationRef {
  _AccommodationsForDestinationProviderElement(super.provider);

  @override
  int get destinationId =>
      (origin as AccommodationsForDestinationProvider).destinationId;
}

String _$searchResultsHash() => r'7134f9024c027e92396a634e7704d573dd408e68';

/// See also [searchResults].
@ProviderFor(searchResults)
const searchResultsProvider = SearchResultsFamily();

/// See also [searchResults].
class SearchResultsFamily extends Family<AsyncValue<List<Destination>>> {
  /// See also [searchResults].
  const SearchResultsFamily();

  /// See also [searchResults].
  SearchResultsProvider call(
    String query,
  ) {
    return SearchResultsProvider(
      query,
    );
  }

  @override
  SearchResultsProvider getProviderOverride(
    covariant SearchResultsProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'searchResultsProvider';
}

/// See also [searchResults].
class SearchResultsProvider
    extends AutoDisposeFutureProvider<List<Destination>> {
  /// See also [searchResults].
  SearchResultsProvider(
    String query,
  ) : this._internal(
          (ref) => searchResults(
            ref as SearchResultsRef,
            query,
          ),
          from: searchResultsProvider,
          name: r'searchResultsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchResultsHash,
          dependencies: SearchResultsFamily._dependencies,
          allTransitiveDependencies:
              SearchResultsFamily._allTransitiveDependencies,
          query: query,
        );

  SearchResultsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<Destination>> Function(SearchResultsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchResultsProvider._internal(
        (ref) => create(ref as SearchResultsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Destination>> createElement() {
    return _SearchResultsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchResultsProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchResultsRef on AutoDisposeFutureProviderRef<List<Destination>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchResultsProviderElement
    extends AutoDisposeFutureProviderElement<List<Destination>>
    with SearchResultsRef {
  _SearchResultsProviderElement(super.provider);

  @override
  String get query => (origin as SearchResultsProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
