import 'package:isar/isar.dart';

part 'insight.g.dart';

@collection
class Insight {
  Id id = Isar.autoIncrement;

  @Index()
  int? destinationId;

  @Index()
  String? type; // 'warning', 'scam', 'trend', 'crowd', 'food'

  String? content;

  DateTime? timestamp;
}
