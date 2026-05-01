# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Code generation (required after any model/provider change)
dart run build_runner build --delete-conflicting-outputs

# Lint
flutter analyze

# Run (Linux desktop — Isar requires a native platform; web is incompatible)
flutter run -d linux

# Android
flutter build apk --release
flutter build apk --debug

# Tests
flutter test
flutter test test/widget_test.dart   # single file
```

> **Linux build pre-requisite**: `sudo apt install ninja-build cmake clang`
> **Web is not supported**: Isar (the local DB) has no web backend.

## Architecture

**Offline-first** — all data lives in an Isar (SQLite-like) database seeded from `assets/data/destinations_seed.json` on first launch. There is no remote API in use yet; `SyncRepositoryImpl.performWeeklySync()` is a commented stub ready for a future delta endpoint.

### Startup sequence (`lib/main.dart`)

```
HiveService.init() → LocalDatabase.init() → DataSeeder.seed() → runApp(ProviderScope(...))
```

`localDatabaseProvider` and `hiveServiceProvider` both throw `UnimplementedError` by default. They are **overridden** in `main()` via `ProviderScope(overrides: [...])` with pre-initialized instances. Do not call them before `runApp` completes.

### Layer structure

```
lib/
  core/
    database/      LocalDatabase (Isar), DataSeeder (JSON → DB, SharedPrefs guard)
    services/      HiveService (sync metadata), ConnectivityService
    constants/     destination_images.dart (id → Unsplash URL map)
  features/
    destination/   Isar models + IDestinationRepository + DestinationRepositoryImpl
    recommendation/ RecommendationEngine (composite scoring) + UserPreferences entity
    research/      ResearchAggregator (builds DestinationInfoCards from DB)
    sync/          ISyncRepository + SyncRepositoryImpl (Hive-backed)
  ai/
    inference/     IAIService interface (not implemented — future Qwen/LLM hook)
  screens/         Presentation layer
  widgets/         Reusable widgets
  app_router.dart  GoRouter + AppShell (ShellRoute with BottomNavigationBar)
  app.dart         TourMateApp (MaterialApp.router)
```

### Navigation (go_router)

| Route | Screen | Shell? |
|---|---|---|
| `/` | HomeScreen | ✓ |
| `/search?q=...` | SearchResultsScreen | ✓ |
| `/plan` | TripPlannerScreen | ✓ |
| `/profile` | ProfileScreen | ✓ |
| `/place/:id` | PlaceDetailsScreen | ✗ |
| `/place/:id/hotels` | HotelStayScreen | ✗ |

Shell routes share the bottom navigation bar from `AppShell`. Full-screen routes (place details, hotels) do not. HomeScreen does **not** wrap itself in a `Scaffold` — `AppShell` provides it.

### Riverpod providers

All providers live alongside their implementations (not in a separate file). Key ones:

- `localDatabaseProvider` / `isarProvider` — `keepAlive: true`, overridden in main
- `hiveServiceProvider` — `keepAlive: true`, overridden in main
- `appRouterProvider` — `keepAlive: true`
- `destinationRepositoryProvider` — derives from `isarProvider`
- `popularDestinationsProvider` — top 6 by popularity score
- `searchResultsProvider(query)` — family; empty list when query is empty
- `destinationByIdProvider(id)` — family
- `accommodationsForDestinationProvider(id)` — family
- `recommendedDestinationsProvider(prefs)` — family; composite scoring engine
- `destinationInfoCardsProvider(id)` — family; aggregates all 4 collections into `DestinationInfoCards`
- `selectedCategoryProvider` — `StateProvider<String>` for home screen category chip

### Code generation

All `@riverpod`, `@collection` (Isar), and `@HiveType` annotations need `dart run build_runner build`. Generated files (`*.g.dart`) are committed. After changing a model or adding a provider, always regenerate. Existing `.g.dart` files may show `ProviderRef`/`AutoDisposeProviderRef` deprecation warnings — these are emitted by riverpod_generator 2.x and cannot be fixed without upgrading to riverpod 3.x (breaking change).

### Data models (Isar `@collection`)

Four collections: `Destination`, `Accommodation`, `Transport`, `Insight`.
- All live in `lib/features/destination/data/models/`
- IDs in seed JSON are **explicit** (non-zero) so Isar uses them directly. `DataSeeder` sets `..id = d['id']`.
- `Destination.vectorEmbedding` (`List<double>?`) is reserved for future on-device RAG with Qwen.
- `Transport` uses `@Index()` on `destinationId` and `@Index(type: IndexType.hash)` on `mode`.

### ResearchAggregator

`lib/features/research/data/services/research_aggregator.dart` builds a `DestinationInfoCards` object containing six card states (Overview, TravelGuide, Stay, FoodActivity, RecentInsights, AISummary) by fetching all four Isar collections for a destination in parallel. The AI summary is a template string; it will be replaced by `IAIService` when an on-device model is integrated.

### Recommendation engine

`RecommendationEngine` scores all destinations against `UserPreferences` (max 100 pts):
- Budget match: 0–30
- Tag match: 0–30 (10 pts/tag, max 3 tags)
- Duration match: 0–20 (exact: 20, ±1: 15, ±2: 8)
- Popularity: 0–20 (`popularityScore / 10 * 20`)

### Android Gradle compatibility

`isar_flutter_libs 3.1.0+1` is incompatible with AGP 8.0+ out of the box. Two patches in `android/build.gradle.kts` (in the `subprojects { if (!state.executed) { afterEvaluate {} } }` block):
1. Sets `namespace = project.group` for libraries that don't declare one.
2. Bumps `compileSdk` to 34 for libraries declaring `compileSdkVersion 30` (fixes `android:attr/lStar` resource link error in release builds).

If `flutter pub upgrade` brings in a new `isar_flutter_libs` version that already sets these, the patches are harmless no-ops.

### Theme

`lib/theme/app_theme.dart` — Material 3, `ColorScheme.fromSeed(seedColor: Color(0xFF0D9488))` (River Teal). Fonts: Plus Jakarta Sans (headings) + Be Vietnam Pro (body) via `google_fonts`.

### Destination images

`lib/core/constants/destination_images.dart` — static `Map<int, String>` keyed by destination ID (1–8) with Unsplash URLs. Use `destinationImageUrl(id)` for 800px or `destinationImageUrl(id, large: true)` for 1200px.
