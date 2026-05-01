import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../destination/data/models/destination.dart';
import '../../../destination/data/repositories/destination_repository_impl.dart';
import '../entities/user_preferences.dart';

part 'recommendation_engine.g.dart';

class RecommendationEngine {
  final List<Destination> _allDestinations;

  RecommendationEngine(this._allDestinations);

  List<Destination> recommend(UserPreferences prefs) {
    final scored = _allDestinations
        .map((d) => _ScoredDestination(d, _score(d, prefs)))
        .toList()
      ..sort((a, b) => b.score.compareTo(a.score));

    return scored.map((sd) => sd.destination).toList();
  }

  double _score(Destination d, UserPreferences prefs) {
    double score = 0;

    // Budget match (0–30 pts)
    if (d.estimatedBudget != null) {
      if (d.estimatedBudget! <= prefs.maxBudget) {
        final ratio = d.estimatedBudget! / prefs.maxBudget;
        score += 30 * (1 - (ratio * 0.5));
      }
    }

    // Tag match (0–30 pts): 10 pts per matching tag, max 3 tags
    if (prefs.preferredTags.isNotEmpty && d.tags != null) {
      final matchCount = (d.tags ?? [])
          .where((t) => prefs.preferredTags.any(
              (p) => t.toLowerCase().contains(p.toLowerCase())))
          .length;
      score += (matchCount.clamp(0, 3) / 3.0) * 30;
    }

    // Duration match (0–20 pts)
    if (d.averageTripDays != null) {
      final dayDiff = (d.averageTripDays! - prefs.tripDays).abs();
      if (dayDiff == 0) {
        score += 20;
      } else if (dayDiff == 1) {
        score += 15;
      } else if (dayDiff == 2) {
        score += 8;
      }
    }

    // Popularity (0–20 pts): normalized 0–10 scale → 0–20
    if (d.popularityScore != null) {
      score += (d.popularityScore! / 10.0) * 20;
    }

    return score;
  }
}

class _ScoredDestination {
  final Destination destination;
  final double score;
  _ScoredDestination(this.destination, this.score);
}

@riverpod
Future<RecommendationEngine> recommendationEngine(RecommendationEngineRef ref) async {
  final destRepo = ref.watch(destinationRepositoryProvider);
  final allDests = await destRepo.getAllDestinations();
  return RecommendationEngine(allDests);
}

@riverpod
Future<List<Destination>> recommendedDestinations(
  RecommendedDestinationsRef ref,
  UserPreferences prefs,
) async {
  final engine = await ref.watch(recommendationEngineProvider.future);
  return engine.recommend(prefs);
}

final selectedCategoryProvider = StateProvider<String>((ref) => 'All');
