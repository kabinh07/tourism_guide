import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_service.g.dart';

class HiveService {
  static const String _syncBoxName = 'sync_metadata';

  late final Box _syncBox;

  Future<void> init() async {
    await Hive.initFlutter();
    _syncBox = await Hive.openBox(_syncBoxName);
  }

  Future<void> setLastSyncTime(DateTime dt) async {
    await _syncBox.put('lastSyncTime', dt.toIso8601String());
  }

  DateTime? getLastSyncTime() {
    final val = _syncBox.get('lastSyncTime');
    if (val == null) return null;
    return DateTime.tryParse(val as String);
  }

  Future<void> setSchemaVersion(int version) async {
    await _syncBox.put('schemaVersion', version);
  }

  int getSchemaVersion() {
    return _syncBox.get('schemaVersion', defaultValue: 0) as int;
  }
}

@Riverpod(keepAlive: true)
HiveService hiveService(HiveServiceRef ref) {
  throw UnimplementedError('HiveService not initialized');
}
