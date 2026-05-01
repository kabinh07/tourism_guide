import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/destination/data/models/destination.dart';
import '../../features/destination/data/models/accommodation.dart';
import '../../features/destination/data/models/insight.dart';
import '../../features/destination/data/models/transport.dart';

part 'local_database.g.dart';

class LocalDatabase {
  late final Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [DestinationSchema, AccommodationSchema, InsightSchema, TransportSchema],
      directory: dir.path,
      name: 'tourism_guide_db',
    );
  }
}

@Riverpod(keepAlive: true)
LocalDatabase localDatabase(LocalDatabaseRef ref) {
  throw UnimplementedError('Database not initialized');
}

@Riverpod(keepAlive: true)
Isar isar(IsarRef ref) {
  return ref.watch(localDatabaseProvider).isar;
}
