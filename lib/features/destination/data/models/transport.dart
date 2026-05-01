import 'package:isar/isar.dart';

part 'transport.g.dart';

@collection
class Transport {
  Id id = Isar.autoIncrement;

  @Index()
  int? destinationId;

  String? fromCity;

  @Index(type: IndexType.hash)
  String? mode; // bus, train, launch, flight, boat, jeep

  String? operator;
  String? approxCost;
  String? duration;
  List<String>? tips;
}
