import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/database/local_database.dart';
import 'core/database/data_seeder.dart';
import 'core/services/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize Hive (sync metadata store)
  final hiveService = HiveService();
  await hiveService.init();

  // 2. Initialize Isar (main database)
  final localDatabase = LocalDatabase();
  await localDatabase.init();

  // 3. Seed data on first run
  final seeder = DataSeeder(localDatabase.isar);
  await seeder.seed();

  // 4. Start the app with pre-initialized services injected via overrides
  runApp(
    ProviderScope(
      overrides: [
        localDatabaseProvider.overrideWithValue(localDatabase),
        hiveServiceProvider.overrideWithValue(hiveService),
      ],
      child: const TourMateApp(),
    ),
  );
}
