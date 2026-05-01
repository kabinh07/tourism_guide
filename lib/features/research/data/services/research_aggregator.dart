import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../destination/data/models/destination.dart';
import '../../../destination/data/models/accommodation.dart';
import '../../../destination/data/models/transport.dart';
import '../../../destination/data/models/insight.dart';
import '../../../destination/domain/repositories/i_destination_repository.dart';
import '../../../destination/data/repositories/destination_repository_impl.dart';
import '../../domain/entities/information_cards.dart';

part 'research_aggregator.g.dart';

class ResearchAggregator {
  final IDestinationRepository _repo;

  ResearchAggregator(this._repo);

  Future<DestinationInfoCards> buildCards(int destinationId) async {
    final dest = await _repo.getDestinationById(destinationId);
    if (dest == null) throw Exception('Destination $destinationId not found');

    final accommodations = await _repo.getAccommodationsForDestination(destinationId);
    final transports = await _repo.getTransportsForDestination(destinationId);
    final insights = await _repo.getInsightsForDestination(destinationId);

    return DestinationInfoCards(
      overview: _buildOverview(dest),
      travelGuide: _buildTravelGuide(transports),
      stay: _buildStay(accommodations),
      foodActivity: _buildFoodActivity(dest, insights),
      recentInsights: _buildInsights(insights),
      aiSummary: _buildAISummary(dest),
    );
  }

  OverviewCardState _buildOverview(Destination dest) {
    return OverviewCardState(
      bestTime: dest.bestSeason ?? 'Year-round',
      idealDuration: '${dest.averageTripDays ?? 2}–${(dest.averageTripDays ?? 2) + 1} days',
      estimatedTotalBudget: '${dest.estimatedBudget?.toStringAsFixed(0) ?? 'N/A'} BDT (solo)',
    );
  }

  TravelGuideCardState _buildTravelGuide(List<Transport> transports) {
    final fromDhaka = transports.where((t) => t.fromCity == 'Dhaka').toList();
    if (fromDhaka.isEmpty) {
      return TravelGuideCardState(
        howToGo: 'Multiple routes available',
        transportDetails: 'Check local transport options',
        approxTransportCost: 'Varies',
      );
    }
    final primary = fromDhaka.first;
    final allModes = transports.map((t) => t.mode ?? '').toSet().join(', ');
    return TravelGuideCardState(
      howToGo: 'From Dhaka via ${primary.mode ?? 'bus'} (${primary.duration ?? ''})',
      transportDetails: 'Operator: ${primary.operator ?? ''}. Available modes: $allModes',
      approxTransportCost: primary.approxCost ?? 'N/A',
    );
  }

  StayCardState _buildStay(List<Accommodation> accommodations) {
    final types = ['budget', 'mid-range', 'resort'];
    final groups = types.map((type) {
      final matching = accommodations.where((a) => a.type == type).toList();
      return AccommodationGroup(
        type: type,
        options: matching.map((a) => AccommodationSummary(
          name: a.name ?? '',
          priceRange: a.priceRange ?? '',
          amenities: a.amenities ?? [],
        )).toList(),
      );
    }).where((g) => g.options.isNotEmpty).toList();
    return StayCardState(groups: groups);
  }

  FoodActivityCardState _buildFoodActivity(Destination dest, List<Insight> insights) {
    final foodInsights = insights
        .where((i) => i.type == 'food')
        .map((i) => i.content ?? '')
        .where((c) => c.isNotEmpty)
        .toList();
    return FoodActivityCardState(
      activities: dest.activityList ?? [],
      foodHighlights: foodInsights,
    );
  }

  RecentInsightsCardState _buildInsights(List<Insight> insights) {
    return RecentInsightsCardState(
      warnings: insights
          .where((i) => i.type == 'warning')
          .map((i) => InsightEntry(content: i.content ?? '', timestamp: i.timestamp))
          .toList(),
      scams: insights
          .where((i) => i.type == 'scam')
          .map((i) => InsightEntry(content: i.content ?? '', timestamp: i.timestamp))
          .toList(),
      trends: insights
          .where((i) => i.type == 'trend')
          .map((i) => InsightEntry(content: i.content ?? '', timestamp: i.timestamp))
          .toList(),
    );
  }

  AISummaryCardState _buildAISummary(Destination dest) {
    final budget = dest.estimatedBudget?.toStringAsFixed(0) ?? 'N/A';
    final days = dest.averageTripDays ?? 2;
    final season = dest.bestSeason ?? 'year-round';
    final tags = dest.tags?.take(3).join(', ') ?? '';
    final firstSentence = dest.description?.split('.').first ?? '';
    final summary =
        '${dest.name} is a $tags destination in ${dest.division}, best visited $season. '
        'A $days-day trip typically costs around $budget BDT per person, '
        'covering accommodation, food, and local transport. '
        '$firstSentence.';
    return AISummaryCardState(summary);
  }
}

@riverpod
ResearchAggregator researchAggregator(ResearchAggregatorRef ref) {
  return ResearchAggregator(ref.watch(destinationRepositoryProvider));
}

@riverpod
Future<DestinationInfoCards> destinationInfoCards(
  DestinationInfoCardsRef ref,
  int destinationId,
) async {
  final aggregator = ref.watch(researchAggregatorProvider);
  return aggregator.buildCards(destinationId);
}
