class OverviewCardState {
  final String bestTime;
  final String idealDuration;
  final String estimatedTotalBudget;

  OverviewCardState({
    required this.bestTime,
    required this.idealDuration,
    required this.estimatedTotalBudget,
  });
}

class TravelGuideCardState {
  final String howToGo;
  final String transportDetails;
  final String approxTransportCost;

  TravelGuideCardState({
    required this.howToGo,
    required this.transportDetails,
    required this.approxTransportCost,
  });
}

class StayCardState {
  final List<AccommodationGroup> groups;

  StayCardState({required this.groups});
}

class AccommodationGroup {
  final String type;
  final List<AccommodationSummary> options;

  AccommodationGroup({required this.type, required this.options});
}

class AccommodationSummary {
  final String name;
  final String priceRange;
  final List<String> amenities;

  AccommodationSummary({
    required this.name,
    required this.priceRange,
    required this.amenities,
  });
}

class FoodActivityCardState {
  final List<String> activities;
  final List<String> foodHighlights;

  FoodActivityCardState({required this.activities, required this.foodHighlights});
}

class RecentInsightsCardState {
  final List<InsightEntry> warnings;
  final List<InsightEntry> scams;
  final List<InsightEntry> trends;

  RecentInsightsCardState({
    required this.warnings,
    required this.scams,
    required this.trends,
  });
}

class InsightEntry {
  final String content;
  final DateTime? timestamp;

  InsightEntry({required this.content, this.timestamp});
}

class AISummaryCardState {
  final String summary;

  AISummaryCardState(this.summary);
}

class DestinationInfoCards {
  final OverviewCardState overview;
  final TravelGuideCardState travelGuide;
  final StayCardState stay;
  final FoodActivityCardState foodActivity;
  final RecentInsightsCardState recentInsights;
  final AISummaryCardState aiSummary;

  DestinationInfoCards({
    required this.overview,
    required this.travelGuide,
    required this.stay,
    required this.foodActivity,
    required this.recentInsights,
    required this.aiSummary,
  });
}
