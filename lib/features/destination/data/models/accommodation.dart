import 'package:isar/isar.dart';

part 'accommodation.g.dart';

@collection
class Accommodation {
  Id id = Isar.autoIncrement;

  @Index()
  int? destinationId;

  String? name;
  
  @Index()
  String? type; // 'budget', 'resort', 'mid-range'

  String? priceRange;
  
  List<String>? amenities;
}
