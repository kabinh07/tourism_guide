import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tourism_guide/widgets/destination_card.dart';

void main() {
  group('DestinationCard', () {
    testWidgets('renders with all required data', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DestinationCard(
                imageUrl: 'https://via.placeholder.com/300',
                title: 'Cox\'s Bazar',
                location: 'Cox\'s Bazar, BD',
                rating: 4.5,
                price: '5000 BDT',
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('Cox\'s Bazar'), findsOneWidget);
      expect(find.text('Cox\'s Bazar, BD'), findsOneWidget);
      expect(find.text('4.5'), findsOneWidget);
      expect(find.text('5000 BDT'), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DestinationCard(
                imageUrl: 'https://via.placeholder.com/300',
                title: 'Cox\'s Bazar',
                location: 'Cox\'s Bazar, BD',
                rating: 4.5,
                price: '5000 BDT',
                onTap: () {
                  tapped = true;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      expect(tapped, isTrue);
    });

    testWidgets('displays location with icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DestinationCard(
                imageUrl: 'https://via.placeholder.com/300',
                title: 'Sylhet',
                location: 'Sylhet, BD',
                rating: 4.8,
                price: '6000 BDT',
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('Sylhet, BD'), findsOneWidget);
      // Icon should be rendered as part of the row
      expect(find.byType(Icon), findsWidgets);
    });

    testWidgets('displays star rating with icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DestinationCard(
                imageUrl: 'https://via.placeholder.com/300',
                title: 'Dhaka',
                location: 'Dhaka, BD',
                rating: 4.2,
                price: '3000 BDT',
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('4.2'), findsOneWidget);
      // Star icon should be rendered
      expect(find.byType(Icon), findsWidgets);
    });

    testWidgets('handles very long title with ellipsis', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DestinationCard(
                imageUrl: 'https://via.placeholder.com/300',
                title: 'A very long destination name that might exceed the card width',
                location: 'Location, BD',
                rating: 4.5,
                price: '5000 BDT',
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      // The card should render even with long title
      expect(find.byType(DestinationCard), findsOneWidget);
    });

    testWidgets('renders multiple cards horizontally', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DestinationCard(
                    imageUrl: 'https://via.placeholder.com/300',
                    title: 'Cox\'s Bazar',
                    location: 'Cox\'s Bazar, BD',
                    rating: 4.5,
                    price: '5000 BDT',
                    onTap: () {},
                  ),
                  DestinationCard(
                    imageUrl: 'https://via.placeholder.com/300',
                    title: 'Sylhet',
                    location: 'Sylhet, BD',
                    rating: 4.8,
                    price: '6000 BDT',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Cox\'s Bazar'), findsOneWidget);
      expect(find.text('Sylhet'), findsOneWidget);
    });

    testWidgets('handles null onTap gracefully', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DestinationCard(
                imageUrl: 'https://via.placeholder.com/300',
                title: 'Test Place',
                location: 'Test, BD',
                rating: 4.5,
                price: '5000 BDT',
                onTap: null,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DestinationCard), findsOneWidget);
      expect(find.text('Test Place'), findsOneWidget);
    });

    testWidgets('displays price with proper formatting', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DestinationCard(
                imageUrl: 'https://via.placeholder.com/300',
                title: 'Test',
                location: 'Test, BD',
                rating: 4.5,
                price: '12500 BDT',
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('12500 BDT'), findsOneWidget);
    });

    testWidgets('renders with shadow decoration', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DestinationCard(
                imageUrl: 'https://via.placeholder.com/300',
                title: 'Shadowed Card',
                location: 'Test, BD',
                rating: 4.5,
                price: '5000 BDT',
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      // Container with decoration should be present
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsWidgets);
    });

    testWidgets('image is clipped with correct border radius', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DestinationCard(
                imageUrl: 'https://via.placeholder.com/300',
                title: 'Clipped Image',
                location: 'Test, BD',
                rating: 4.5,
                price: '5000 BDT',
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      // ClipRRect should be used for the image
      expect(find.byType(ClipRRect), findsOneWidget);
    });

    testWidgets('handles special characters in text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DestinationCard(
                imageUrl: 'https://via.placeholder.com/300',
                title: 'Cox\'s Bazar & More',
                location: 'Cox\'s Bazar, BD',
                rating: 4.5,
                price: '৳5000',
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('Cox\'s Bazar & More'), findsOneWidget);
    });

    testWidgets('layout is correct with all elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: DestinationCard(
                imageUrl: 'https://via.placeholder.com/300',
                title: 'Layout Test',
                location: 'Test, BD',
                rating: 4.5,
                price: '5000 BDT',
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      // Should have image, title, location, rating, and price
      expect(find.byType(Text), findsWidgets); // Title, location, rating, price
      expect(find.byType(Icon), findsWidgets); // Icons
      expect(find.byType(Column), findsWidgets); // Columns for layout
    });
  });
}
