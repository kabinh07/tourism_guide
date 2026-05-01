import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/local_database.dart';
import '../../domain/repositories/i_destination_repository.dart';
import '../models/destination.dart';
import '../models/accommodation.dart';
import '../models/transport.dart';
import '../models/insight.dart';

part 'destination_repository_impl.g.dart';

class DestinationRepositoryImpl implements IDestinationRepository {
  final Isar isar;

  DestinationRepositoryImpl(this.isar);

  @override
  Future<List<Destination>> getAllDestinations() async {
    return await isar.destinations.where().findAll();
  }

  @override
  Future<Destination?> getDestinationById(int id) async {
    return await isar.destinations.get(id);
  }

  @override
  Future<void> saveDestination(Destination destination) async {
    await isar.writeTxn(() async {
      await isar.destinations.put(destination);
    });
  }

  @override
  Future<List<Destination>> searchDestinations(String query) async {
    return await isar.destinations
        .filter()
        .nameContains(query, caseSensitive: false)
        .or()
        .descriptionContains(query, caseSensitive: false)
        .findAll();
  }

  @override
  Future<List<Destination>> getDestinationsByTag(String tag) async {
    return await isar.destinations
        .filter()
        .tagsElementContains(tag, caseSensitive: false)
        .findAll();
  }

  @override
  Future<List<Destination>> getPopularDestinations({int limit = 10}) async {
    return await isar.destinations
        .where()
        .sortByPopularityScoreDesc()
        .limit(limit)
        .findAll();
  }

  @override
  Future<List<Destination>> getDestinationsByBudget(double maxBudget) async {
    return await isar.destinations
        .filter()
        .estimatedBudgetLessThan(maxBudget + 1)
        .sortByPopularityScoreDesc()
        .findAll();
  }

  @override
  Future<List<Accommodation>> getAccommodationsForDestination(int destinationId) async {
    return await isar.accommodations
        .where()
        .destinationIdEqualTo(destinationId)
        .findAll();
  }

  @override
  Future<List<Transport>> getTransportsForDestination(int destinationId) async {
    return await isar.transports
        .where()
        .destinationIdEqualTo(destinationId)
        .findAll();
  }

  @override
  Future<List<Insight>> getInsightsForDestination(int destinationId) async {
    return await isar.insights
        .where()
        .destinationIdEqualTo(destinationId)
        .findAll();
  }
}

@riverpod
IDestinationRepository destinationRepository(DestinationRepositoryRef ref) {
  return DestinationRepositoryImpl(ref.watch(isarProvider));
}

@riverpod
Future<List<Destination>> popularDestinations(PopularDestinationsRef ref) async {
  final repo = ref.watch(destinationRepositoryProvider);
  return repo.getPopularDestinations(limit: 6);
}

@riverpod
Future<List<String>> allDestinationTags(AllDestinationTagsRef ref) async {
  final repo = ref.watch(destinationRepositoryProvider);
  final all = await repo.getAllDestinations();
  final tags = <String>{};
  for (final d in all) {
    tags.addAll(d.tags ?? []);
  }
  return ['All', ...tags.toList()..sort()];
}

@riverpod
Future<Destination?> destinationById(DestinationByIdRef ref, int id) async {
  final repo = ref.watch(destinationRepositoryProvider);
  return repo.getDestinationById(id);
}

@riverpod
Future<List<Accommodation>> accommodationsForDestination(AccommodationsForDestinationRef ref, int destinationId) async {
  final repo = ref.watch(destinationRepositoryProvider);
  return repo.getAccommodationsForDestination(destinationId);
}

@riverpod
Future<List<Destination>> searchResults(SearchResultsRef ref, String query) async {
  if (query.isEmpty) return [];
  final repo = ref.watch(destinationRepositoryProvider);
  return repo.searchDestinations(query);
}
