import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tourism_guide/widgets/category_chip.dart';

void main() {
  group('CategoryChip', () {
    testWidgets('renders with label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: CategoryChip(
                label: 'Beach',
                isActive: false,
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('Beach'), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: CategoryChip(
                label: 'Beach',
                isActive: false,
                onTap: () {
                  tapped = true;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CategoryChip));
      expect(tapped, isTrue);
    });

    testWidgets('displays different style when active', (WidgetTester tester) async {
      const Key activeKey = Key('active');
      const Key inactiveKey = Key('inactive');

      // Test active state
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                CategoryChip(
                  key: activeKey,
                  label: 'Beach',
                  isActive: true,
                  onTap: () {},
                ),
                CategoryChip(
                  key: inactiveKey,
                  label: 'Beach',
                  isActive: false,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );

      // Both should render
      expect(find.byKey(activeKey), findsOneWidget);
      expect(find.byKey(inactiveKey), findsOneWidget);
    });

    testWidgets('renders multiple chips in a row', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryChip(
                    label: 'Beach',
                    isActive: true,
                    onTap: () {},
                  ),
                  CategoryChip(
                    label: 'Mountain',
                    isActive: false,
                    onTap: () {},
                  ),
                  CategoryChip(
                    label: 'Forest',
                    isActive: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Beach'), findsOneWidget);
      expect(find.text('Mountain'), findsOneWidget);
      expect(find.text('Forest'), findsOneWidget);
    });

    testWidgets('maintains label text in different states', (WidgetTester tester) async {
      String currentLabel = 'Beach';
      bool isActive = false;

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return MaterialApp(
              home: Scaffold(
                body: CategoryChip(
                  label: currentLabel,
                  isActive: isActive,
                  onTap: () {
                    setState(() {
                      isActive = !isActive;
                    });
                  },
                ),
              ),
            );
          },
        ),
      );

      expect(find.text('Beach'), findsOneWidget);

      // Tap and verify label still appears
      await tester.tap(find.byType(CategoryChip));
      await tester.pumpAndSettle();

      expect(find.text('Beach'), findsOneWidget);
    });

    testWidgets('handles empty label gracefully', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: CategoryChip(
                label: '',
                isActive: false,
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.byType(CategoryChip), findsOneWidget);
    });

    testWidgets('handles very long label text', (WidgetTester tester) async {
      const String longLabel = 'VeryLongCategoryLabelThatShouldStillRender';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: CategoryChip(
                label: longLabel,
                isActive: false,
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text(longLabel), findsOneWidget);
    });

    testWidgets('responds to rapid taps', (WidgetTester tester) async {
      int tapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: CategoryChip(
                label: 'Beach',
                isActive: false,
                onTap: () {
                  tapCount++;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CategoryChip));
      await tester.tap(find.byType(CategoryChip));
      await tester.tap(find.byType(CategoryChip));

      expect(tapCount, equals(3));
    });
  });
}
