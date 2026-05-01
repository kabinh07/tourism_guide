import '../../data/models/destination.dart';
import '../../data/models/accommodation.dart';
import '../../data/models/transport.dart';
import '../../data/models/insight.dart';

abstract class IDestinationRepository {
  Future<List<Destination>> getAllDestinations();
  Future<List<Destination>> searchDestinations(String query);
  Future<Destination?> getDestinationById(int id);
  Future<void> saveDestination(Destination destination);

  // Filter methods
  Future<List<Destination>> getDestinationsByTag(String tag);
  Future<List<Destination>> getPopularDestinations({int limit = 10});
  Future<List<Destination>> getDestinationsByBudget(double maxBudget);

  // Related collections
  Future<List<Accommodation>> getAccommodationsForDestination(int destinationId);
  Future<List<Transport>> getTransportsForDestination(int destinationId);
  Future<List<Insight>> getInsightsForDestination(int destinationId);
}
