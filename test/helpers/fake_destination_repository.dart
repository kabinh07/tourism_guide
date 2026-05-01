import 'package:tourism_guide/features/destination/data/models/accommodation.dart';
import 'package:tourism_guide/features/destination/data/models/destination.dart';
import 'package:tourism_guide/features/destination/data/models/insight.dart';
import 'package:tourism_guide/features/destination/data/models/transport.dart';
import 'package:tourism_guide/features/destination/domain/repositories/i_destination_repository.dart';

import 'test_data.dart';

/// Fake in-memory implementation of IDestinationRepository for testing
class FakeDestinationRepository implements IDestinationRepository {
  final List<Destination> _destinations;
  final List<Accommodation> _accommodations;
  final List<Transport> _transports;
  final List<Insight> _insights;

  FakeDestinationRepository({
    List<Destination>? destinations,
    List<Accommodation>? accommodations,
    List<Transport>? transports,
    List<Insight>? insights,
  })  : _destinations = destinations ?? [],
        _accommodations = accommodations ?? [],
        _transports = transports ?? [],
        _insights = insights ?? [];

  /// Factory constructor that provides sample data
  factory FakeDestinationRepository.withSampleData() {
    final destinations = [
      makeDestination(id: 1, name: 'Cox\'s Bazar', district: 'Cox\'s Bazar', tags: ['beach', 'sea']),
      makeDestination(id: 2, name: 'Sylhet', district: 'Sylhet', tags: ['tea', 'hills']),
      makeDestination(id: 3, name: 'Dhaka', district: 'Dhaka', tags: ['city', 'culture']),
    ];

    final accommodations = [
      makeAccommodation(id: 1, destinationId: 1, name: 'Beach Resort'),
      makeAccommodation(id: 2, destinationId: 1, name: 'Sea View Hotel'),
      makeAccommodation(id: 3, destinationId: 2, name: 'Tea Garden Lodge'),
    ];

    final transports = [
      makeTransport(id: 1, destinationId: 1, mode: 'bus', fromCity: 'Dhaka'),
      makeTransport(id: 2, destinationId: 1, mode: 'flight', fromCity: 'Dhaka'),
      makeTransport(id: 3, destinationId: 2, mode: 'bus', fromCity: 'Dhaka'),
    ];

    final insights = [
      makeInsight(id: 1, destinationId: 1, content: 'Best beaches in Cox\'s Bazar'),
      makeInsight(id: 2, destinationId: 1, content: 'Local food guide'),
      makeInsight(id: 3, destinationId: 2, content: 'Tea plantations'),
    ];

    return FakeDestinationRepository(
      destinations: destinations,
      accommodations: accommodations,
      transports: transports,
      insights: insights,
    );
  }

  @override
  Future<List<Destination>> getAllDestinations() async {
    return Future.value(_destinations);
  }

  @override
  Future<Destination?> getDestinationById(int id) async {
    try {
      return _destinations.firstWhere((d) => d.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Destination>> searchDestinations(String query) async {
    final lower = query.toLowerCase();
    return _destinations
        .where((d) =>
            (d.name?.toLowerCase().contains(lower) ?? false) ||
            (d.description?.toLowerCase().contains(lower) ?? false) ||
            (d.tags?.any((t) => t.toLowerCase().contains(lower)) ?? false))
        .toList();
  }

  @override
  Future<List<Accommodation>> getAccommodationsByDestinationId(int destinationId) async {
    return _accommodations.where((a) => a.destinationId == destinationId).toList();
  }

  @override
  Future<List<Transport>> getTransportByDestinationId(int destinationId) async {
    return _transports.where((t) => t.destinationId == destinationId).toList();
  }

  @override
  Future<List<Insight>> getInsightsByDestinationId(int destinationId) async {
    return _insights.where((i) => i.destinationId == destinationId).toList();
  }

  @override
  Future<List<String>> getAllTags() async {
    final tags = <String>{};
    for (final dest in _destinations) {
      if (dest.tags != null) {
        tags.addAll(dest.tags!);
      }
    }
    return tags.toList();
  }

  @override
  Future<List<Destination>> getDestinationsByTag(String tag) async {
    return _destinations
        .where((d) => d.tags?.any((t) => t.toLowerCase() == tag.toLowerCase()) ?? false)
        .toList();
  }

  @override
  Future<List<Destination>> getPopularDestinations({int limit = 10}) async {
    return _destinations.take(limit).toList();
  }

  @override
  Future<List<Destination>> getDestinationsByBudget(double maxBudget) async {
    return _destinations
        .where((d) => (d.estimatedBudget ?? 0) <= maxBudget)
        .toList();
  }

  @override
  Future<List<Accommodation>> getAccommodationsForDestination(int destinationId) async {
    return _accommodations.where((a) => a.destinationId == destinationId).toList();
  }

  @override
  Future<List<Transport>> getTransportsForDestination(int destinationId) async {
    return _transports.where((t) => t.destinationId == destinationId).toList();
  }

  @override
  Future<List<Insight>> getInsightsForDestination(int destinationId) async {
    return _insights.where((i) => i.destinationId == destinationId).toList();
  }

  @override
  Future<void> saveDestination(Destination destination) async {
    // No-op for testing
    return Future.value();
  }
}
