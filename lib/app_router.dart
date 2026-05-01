import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'screens/home_screen.dart';
import 'screens/place_details_screen.dart';
import 'screens/search_results_screen.dart';
import 'screens/trip_planner_screen.dart';
import 'screens/hotel_stay_screen.dart';
import 'screens/profile_screen.dart';

part 'app_router.g.dart';

class AppRoutes {
  static const home = '/';
  static const search = '/search';
  static const tripPlanner = '/plan';
  static const profile = '/profile';
  static const placeDetails = '/place/:id';
  static const hotelStay = '/place/:id/hotels';
}

@Riverpod(keepAlive: true)
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: AppRoutes.search,
            builder: (context, state) {
              final query = state.uri.queryParameters['q'] ?? '';
              return SearchResultsScreen(initialQuery: query);
            },
          ),
          GoRoute(
            path: AppRoutes.tripPlanner,
            builder: (context, state) => const TripPlannerScreen(),
          ),
          GoRoute(
            path: AppRoutes.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/place/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return PlaceDetailsScreen(destinationId: id);
        },
        routes: [
          GoRoute(
            path: 'hotels',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return HotelStayScreen(destinationId: id);
            },
          ),
        ],
      ),
    ],
  );
}

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _locationToIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: _buildBottomNav(context, currentIndex),
    );
  }

  int _locationToIndex(String location) {
    if (location.startsWith('/search')) return 1;
    if (location.startsWith('/plan')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }

  Widget _buildBottomNav(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/');
            break;
          case 1:
            context.go('/search');
            break;
          case 2:
            context.go('/plan');
            break;
          case 3:
            context.go('/profile');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Plan'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
