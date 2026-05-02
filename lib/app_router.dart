import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
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
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _NavItem(
                    icon: LucideIcons.house,
                    label: 'Explore',
                    isSelected: currentIndex == 0,
                    onTap: () => context.go('/'),
                  ),
                  _NavItem(
                    icon: LucideIcons.search,
                    label: 'Search',
                    isSelected: currentIndex == 1,
                    onTap: () => context.go('/search'),
                  ),
                  _NavItem(
                    icon: LucideIcons.map,
                    label: 'Plan',
                    isSelected: currentIndex == 2,
                    onTap: () => context.go('/plan'),
                  ),
                  _NavItem(
                    icon: LucideIcons.user,
                    label: 'Profile',
                    isSelected: currentIndex == 3,
                    onTap: () => context.go('/profile'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? primary : Colors.grey,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? primary : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: isSelected ? primary : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
