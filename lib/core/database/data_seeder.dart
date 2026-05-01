import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/destination/data/models/destination.dart';
import '../../features/destination/data/models/accommodation.dart';
import '../../features/destination/data/models/insight.dart';
import '../../features/destination/data/models/transport.dart';

class DataSeeder {
  static const String _seededKey = 'db_seeded_v2';

  final Isar isar;

  DataSeeder(this.isar);

  Future<bool> needsSeeding() async {
    final prefs = await SharedPreferences.getInstance();
    return !(prefs.getBool(_seededKey) ?? false);
  }

  Future<void> seed() async {
    if (!await needsSeeding()) return;

    final jsonString = await rootBundle.loadString('assets/data/destinations_seed.json');
    final data = jsonDecode(jsonString) as Map<String, dynamic>;

    await isar.writeTxn(() async {
      // Destinations
      final destList = (data['destinations'] as List).map((d) {
        final dest = Destination()
          ..id = d['id'] as int
          ..name = d['name'] as String?
          ..district = d['district'] as String?
          ..division = d['division'] as String?
          ..description = d['description'] as String?
          ..tags = List<String>.from(d['tags'] ?? [])
          ..estimatedBudget = (d['estimatedBudget'] as num?)?.toDouble()
          ..travelMethods = List<String>.from(d['travelMethods'] ?? [])
          ..bestSeason = d['bestSeason'] as String?
          ..popularityScore = (d['popularityScore'] as num?)?.toDouble()
          ..averageTripDays = d['averageTripDays'] as int?
          ..hotelPriceRange = d['hotelPriceRange'] as String?
          ..foodBudgetRange = d['foodBudgetRange'] as String?
          ..activityList = List<String>.from(d['activityList'] ?? [])
          ..imageUrl = d['imageUrl'] as String?
          ..vectorEmbedding = null;
        return dest;
      }).toList();
      await isar.destinations.putAll(destList);

      // Accommodations
      final accList = (data['accommodations'] as List).map((a) {
        return Accommodation()
          ..destinationId = a['destinationId'] as int?
          ..name = a['name'] as String?
          ..type = a['type'] as String?
          ..priceRange = a['priceRange'] as String?
          ..amenities = List<String>.from(a['amenities'] ?? []);
      }).toList();
      await isar.accommodations.putAll(accList);

      // Transports
      final transList = (data['transports'] as List).map((t) {
        return Transport()
          ..destinationId = t['destinationId'] as int?
          ..fromCity = t['fromCity'] as String?
          ..mode = t['mode'] as String?
          ..operator = t['operator'] as String?
          ..approxCost = t['approxCost'] as String?
          ..duration = t['duration'] as String?
          ..tips = List<String>.from(t['tips'] ?? []);
      }).toList();
      await isar.transports.putAll(transList);

      // Insights
      final insightList = (data['insights'] as List).map((i) {
        return Insight()
          ..destinationId = i['destinationId'] as int?
          ..type = i['type'] as String?
          ..content = i['content'] as String?
          ..timestamp = i['timestamp'] != null
              ? DateTime.tryParse(i['timestamp'] as String)
              : null;
      }).toList();
      await isar.insights.putAll(insightList);
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_seededKey, true);
  }
}
