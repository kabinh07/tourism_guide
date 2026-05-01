// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'research_aggregator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$researchAggregatorHash() =>
    r'9ef0e3f8243ad61326e18170a79d571deb97fa12';

/// See also [researchAggregator].
@ProviderFor(researchAggregator)
final researchAggregatorProvider =
    AutoDisposeProvider<ResearchAggregator>.internal(
  researchAggregator,
  name: r'researchAggregatorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$researchAggregatorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ResearchAggregatorRef = AutoDisposeProviderRef<ResearchAggregator>;
String _$destinationInfoCardsHash() =>
    r'2f98a85a5881ead3a61c6d4a7ed560323a6eb52d';

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

/// See also [destinationInfoCards].
@ProviderFor(destinationInfoCards)
const destinationInfoCardsProvider = DestinationInfoCardsFamily();

/// See also [destinationInfoCards].
class DestinationInfoCardsFamily
    extends Family<AsyncValue<DestinationInfoCards>> {
  /// See also [destinationInfoCards].
  const DestinationInfoCardsFamily();

  /// See also [destinationInfoCards].
  DestinationInfoCardsProvider call(
    int destinationId,
  ) {
    return DestinationInfoCardsProvider(
      destinationId,
    );
  }

  @override
  DestinationInfoCardsProvider getProviderOverride(
    covariant DestinationInfoCardsProvider provider,
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
  String? get name => r'destinationInfoCardsProvider';
}

/// See also [destinationInfoCards].
class DestinationInfoCardsProvider
    extends AutoDisposeFutureProvider<DestinationInfoCards> {
  /// See also [destinationInfoCards].
  DestinationInfoCardsProvider(
    int destinationId,
  ) : this._internal(
          (ref) => destinationInfoCards(
            ref as DestinationInfoCardsRef,
            destinationId,
          ),
          from: destinationInfoCardsProvider,
          name: r'destinationInfoCardsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$destinationInfoCardsHash,
          dependencies: DestinationInfoCardsFamily._dependencies,
          allTransitiveDependencies:
              DestinationInfoCardsFamily._allTransitiveDependencies,
          destinationId: destinationId,
        );

  DestinationInfoCardsProvider._internal(
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
    FutureOr<DestinationInfoCards> Function(DestinationInfoCardsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DestinationInfoCardsProvider._internal(
        (ref) => create(ref as DestinationInfoCardsRef),
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
  AutoDisposeFutureProviderElement<DestinationInfoCards> createElement() {
    return _DestinationInfoCardsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DestinationInfoCardsProvider &&
        other.destinationId == destinationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, destinationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DestinationInfoCardsRef
    on AutoDisposeFutureProviderRef<DestinationInfoCards> {
  /// The parameter `destinationId` of this provider.
  int get destinationId;
}

class _DestinationInfoCardsProviderElement
    extends AutoDisposeFutureProviderElement<DestinationInfoCards>
    with DestinationInfoCardsRef {
  _DestinationInfoCardsProviderElement(super.provider);

  @override
  int get destinationId =>
      (origin as DestinationInfoCardsProvider).destinationId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
