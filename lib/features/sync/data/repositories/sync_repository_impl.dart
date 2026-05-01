import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/hive_service.dart';
import '../../domain/repositories/i_sync_repository.dart';

part 'sync_repository_impl.g.dart';

class SyncRepositoryImpl implements ISyncRepository {
  final HiveService _hiveService;

  SyncRepositoryImpl(this._hiveService);

  @override
  Future<DateTime?> getLastSyncTime() async {
    return _hiveService.getLastSyncTime();
  }

  @override
  Future<void> saveLastSyncTime(DateTime dt) async {
    await _hiveService.setLastSyncTime(dt);
  }

  @override
  bool shouldSync() {
    final last = _hiveService.getLastSyncTime();
    if (last == null) return true;
    return DateTime.now().difference(last).inDays >= 7;
  }

  @override
  Future<void> performWeeklySync() async {
    // Architecture stub for delta JSON download and Isar merge.
    // When a real endpoint exists, replace this with:
    //   1. Dio.get('https://api.tourmate.bd/delta?since={lastSyncTime}')
    //   2. Parse response JSON (same structure as seed JSON)
    //   3. For each destination: isar.writeTxn(() => isar.destinations.put(...))
    //   4. saveLastSyncTime(DateTime.now())
    await saveLastSyncTime(DateTime.now());
  }
}

@riverpod
ISyncRepository syncRepository(SyncRepositoryRef ref) {
  return SyncRepositoryImpl(ref.watch(hiveServiceProvider));
}
