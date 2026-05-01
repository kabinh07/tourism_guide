import 'package:isar/isar.dart';
import 'package:tourism_guide/features/destination/data/models/destination.dart';
import 'package:tourism_guide/features/destination/data/models/accommodation.dart';
import 'package:tourism_guide/features/destination/data/models/transport.dart';
import 'package:tourism_guide/features/destination/data/models/insight.dart';

/// Creates a test Destination with sensible defaults
Destination makeDestination({
  int? id,
  String? name,
  String? description,
  String? district,
  String? division,
  double? estimatedBudget,
  double? popularityScore,
  String? imageUrl,
  List<String>? tags,
  List<double>? vectorEmbedding,
}) {
  return Destination()
    ..id = id ?? 1
    ..name = name ?? 'Test Destination ${id ?? 1}'
    ..description = description ?? 'A test destination'
    ..district = district ?? 'Test District'
    ..division = division ?? 'Test Division'
    ..estimatedBudget = estimatedBudget ?? 5000.0
    ..popularityScore = popularityScore ?? 4.5
    ..imageUrl = imageUrl ?? 'https://images.unsplash.com/photo-1596422846543-75c6fc18a594?auto=format&fit=crop&q=80&w=800'
    ..tags = tags ?? ['beach', 'nature']
    ..vectorEmbedding = vectorEmbedding;
}

/// Creates a test Accommodation with sensible defaults
Accommodation makeAccommodation({
  int? id,
  int? destinationId,
  String? name,
  String? type,
  String? priceRange,
  List<String>? amenities,
}) {
  return Accommodation()
    ..id = id ?? 1
    ..destinationId = destinationId ?? 1
    ..name = name ?? 'Test Hotel ${id ?? 1}'
    ..type = type ?? '5-star'
    ..priceRange = priceRange ?? 'High'
    ..amenities = amenities ?? ['WiFi', 'AC'];
}

/// Creates a test Transport with sensible defaults
Transport makeTransport({
  int? id,
  int? destinationId,
  String? mode,
  String? fromCity,
  String? operator,
  String? approxCost,
  String? duration,
  List<String>? tips,
}) {
  return Transport()
    ..id = id ?? 1
    ..destinationId = destinationId ?? 1
    ..mode = mode ?? 'bus'
    ..fromCity = fromCity ?? 'Dhaka'
    ..operator = operator ?? 'Sample Transport Co'
    ..approxCost = approxCost ?? '1500'
    ..duration = duration ?? '6 hours'
    ..tips = tips ?? ['Book in advance'];
}

/// Creates a test Insight with sensible defaults
Insight makeInsight({
  int? id,
  int? destinationId,
  String? type,
  String? content,
  DateTime? timestamp,
}) {
  return Insight()
    ..id = id ?? 1
    ..destinationId = destinationId ?? 1
    ..type = type ?? 'general'
    ..content = content ?? 'This is a test insight about a destination.'
    ..timestamp = timestamp ?? DateTime.now();
}
