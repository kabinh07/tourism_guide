import 'package:isar/isar.dart';

part 'destination.g.dart';

@collection
class Destination {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? name;

  String? district;
  String? division;

  List<String>? tags;

  String? description;

  double? estimatedBudget;

  List<String>? travelMethods;

  String? bestSeason;

  @Index()
  double? popularityScore;

  int? averageTripDays;

  String? hotelPriceRange;
  String? foodBudgetRange;

  List<String>? activityList;

  String? imageUrl;

  List<double>? vectorEmbedding; // For future Qwen RAG integration
}
