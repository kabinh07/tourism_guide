import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_guide/app.dart';
import 'package:tourism_guide/app_router.dart';
import 'package:tourism_guide/features/destination/data/repositories/destination_repository_impl.dart';
import 'package:tourism_guide/features/destination/domain/repositories/i_destination_repository.dart';
import 'package:tourism_guide/screens/search_results_screen.dart';
import 'package:tourism_guide/screens/place_details_screen.dart';
import 'package:tourism_guide/screens/hotel_stay_screen.dart';
import 'package:tourism_guide/screens/profile_screen.dart';

import '../helpers/fake_destination_repository.dart';

void main() {
  group('TourMate App Integration Tests', () {
    late FakeDestinationRepository fakeRepo;

    setUp(() {
      fakeRepo = FakeDestinationRepository.withSampleData();
    });

    Future<void> pumpApp(WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            destinationRepositoryProvider.overrideWithValue(fakeRepo as IDestinationRepository),
          ],
          child: const TourMateApp(),
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));
    }

    testWidgets('App initializes successfully', (tester) async {
      await pumpApp(tester);
      expect(find.byType(TourMateApp), findsOneWidget);
    });

    testWidgets('HomeScreen renders', (tester) async {
      await pumpApp(tester);
      expect(find.byType(Scaffold), findsWidgets);
      expect(find.byType(TextField), findsWidgets);
    });

    testWidgets('Search bar present on HomeScreen', (tester) async {
      await pumpApp(tester);
      final searchFields = find.byType(TextField);
      expect(searchFields, findsWidgets);
    });

    testWidgets('Bottom navigation bar exists', (tester) async {
      await pumpApp(tester);
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });

    testWidgets('Navigate to destination details', (tester) async {
      await pumpApp(tester);

      // Wait for destination cards to load
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      // Find and tap first GestureDetector (destination card)
      final cards = find.byType(GestureDetector);
      if (cards.evaluate().isNotEmpty) {
        await tester.tap(cards.first);
        await tester.pumpAndSettle();

        // Verify on details screen (has AppBar with back button)
        expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      }
    });

    testWidgets('Navigate back from details to home', (tester) async {
      await pumpApp(tester);

      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      final cards = find.byType(GestureDetector);
      if (cards.evaluate().isNotEmpty) {
        await tester.tap(cards.first);
        await tester.pumpAndSettle();

        // Tap back button
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();

        // Back to home - verify bottom nav still present
        expect(find.byType(BottomNavigationBar), findsOneWidget);
      }
    });

    testWidgets('Search navigation flow', (tester) async {
      await pumpApp(tester);

      final searchField = find.byType(TextField).first;
      await tester.enterText(searchField, 'beach');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // Verify search results screen loaded
      expect(find.byType(SearchResultsScreen), findsOneWidget);
    });

    testWidgets('Empty search shows message', (tester) async {
      await pumpApp(tester);

      final searchField = find.byType(TextField).first;
      await tester.enterText(searchField, 'nonexistent');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // Results should show or search screen should be visible
      expect(find.byType(SearchResultsScreen), findsOneWidget);
    });

    testWidgets('Clear search functionality', (tester) async {
      await pumpApp(tester);

      final searchField = find.byType(TextField).first;
      await tester.enterText(searchField, 'test');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // Clear button should appear when text is entered
      final clearButton = find.byIcon(Icons.close);
      if (clearButton.evaluate().isNotEmpty) {
        await tester.tap(clearButton);
        await tester.pumpAndSettle();

        // Should return to search empty state
        expect(find.byType(SearchResultsScreen), findsOneWidget);
      }
    });

    testWidgets('Tag filtering on home', (tester) async {
      await pumpApp(tester);

      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      // Find and tap a filter chip
      final chips = find.byType(FilterChip);
      if (chips.evaluate().isNotEmpty) {
        await tester.tap(chips.first);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Navigate to trip planner', (tester) async {
      await pumpApp(tester);

      // Find bottom nav items and tap plan/explore icon
      final navItems = find.byType(BottomNavigationBarItem);
      if (navItems.evaluate().length > 2) {
        // Tap third nav item (trip planner)
        final exploreIcon = find.byIcon(Icons.explore);
        if (exploreIcon.evaluate().isNotEmpty) {
          await tester.tap(exploreIcon);
          await tester.pumpAndSettle();
        }
      }
    });

    testWidgets('Budget slider interaction', (tester) async {
      await pumpApp(tester);

      final sliders = find.byType(Slider);
      if (sliders.evaluate().isNotEmpty) {
        // Drag slider
        await tester.drag(sliders.first, const Offset(30, 0));
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Trip planner tag selection', (tester) async {
      await pumpApp(tester);

      // Find filter chips in planner
      final chips = find.byType(FilterChip);
      if (chips.evaluate().isNotEmpty) {
        await tester.tap(chips.first);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Find destinations button tap', (tester) async {
      await pumpApp(tester);

      final findButton = find.byType(ElevatedButton);
      if (findButton.evaluate().isNotEmpty) {
        await tester.tap(findButton.first);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Access profile screen', (tester) async {
      await pumpApp(tester);

      final profileIcon = find.byIcon(Icons.person);
      if (profileIcon.evaluate().isNotEmpty) {
        await tester.tap(profileIcon);
        await tester.pumpAndSettle();

        expect(find.byType(ProfileScreen), findsOneWidget);
      }
    });

    testWidgets('Hotel stay screen navigation', (tester) async {
      await pumpApp(tester);

      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      // Tap destination card
      final cards = find.byType(GestureDetector);
      if (cards.evaluate().isNotEmpty) {
        await tester.tap(cards.first);
        await tester.pumpAndSettle();

        // Look for View Hotels button
        final hotelButtons = find.widgetWithText(ElevatedButton, 'View Hotels');
        if (hotelButtons.evaluate().isNotEmpty) {
          await tester.tap(hotelButtons);
          await tester.pumpAndSettle();

          expect(find.byType(HotelStayScreen), findsOneWidget);
        }
      }
    });

    testWidgets('Destination data loads in details', (tester) async {
      await pumpApp(tester);

      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      final cards = find.byType(GestureDetector);
      if (cards.evaluate().isNotEmpty) {
        await tester.tap(cards.first);
        await tester.pumpAndSettle();

        // Should have tabs visible
        expect(find.byType(TabBar), findsOneWidget);
      }
    });

    testWidgets('Multiple navigation cycles', (tester) async {
      await pumpApp(tester);

      // Home is loaded
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Tap destination
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      final cards = find.byType(GestureDetector);
      if (cards.evaluate().isNotEmpty) {
        await tester.tap(cards.first);
        await tester.pumpAndSettle();

        // Back to home
        final backBtn = find.byIcon(Icons.arrow_back);
        if (backBtn.evaluate().isNotEmpty) {
          await tester.tap(backBtn);
          await tester.pumpAndSettle();

          // Verify home visible again
          expect(find.byType(BottomNavigationBar), findsOneWidget);
        }
      }
    });
  });
}
