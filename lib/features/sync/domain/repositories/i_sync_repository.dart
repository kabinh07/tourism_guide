abstract class ISyncRepository {
  Future<void> performWeeklySync();
  Future<DateTime?> getLastSyncTime();
  Future<void> saveLastSyncTime(DateTime dt);
  bool shouldSync();
}
