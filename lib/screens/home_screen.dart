import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:tourism_guide/widgets/category_chip.dart';
import 'package:tourism_guide/widgets/destination_card.dart';
import 'package:tourism_guide/screens/search_results_screen.dart';
import 'package:tourism_guide/screens/trip_planner_screen.dart';
import 'package:tourism_guide/screens/profile_screen.dart';
import 'package:tourism_guide/screens/place_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: _buildBottomNav(context),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 1:
        return const SearchResultsScreen();
      case 2:
        return const TripPlannerScreen();
      case 3:
        return const ProfileScreen();
      case 0:
      default:
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildHeader(context),
              const SizedBox(height: 24),
              _buildSearchBar(context),
              const SizedBox(height: 32),
              _buildCategories(context),
              const SizedBox(height: 32),
              _buildPopularSection(context),
              const SizedBox(height: 32),
              _buildRecommendedSection(context),
              const SizedBox(height: 20),
            ],
          ),
        );
    }
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            Text(
              'Bangladesh',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 28,
                  ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 24,
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Icon(LucideIcons.user, color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(LucideIcons.search, color: Colors.grey),
          hintText: 'Search destinations, hotels...',
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    final categories = ['All', 'Beach', 'Mountain', 'Forest', 'City'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories
                .map((cat) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: CategoryChip(
                        label: cat,
                        isActive: selectedCategory == cat,
                        onTap: () => setState(() => selectedCategory = cat),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildPopularSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Destinations',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'See All',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DestinationCard(
                  imageUrl: 'https://images.unsplash.com/photo-1596422846543-75c6fc18a594?auto=format&fit=crop&q=80&w=800',
                  title: 'Cox\'s Bazar',
                  location: 'Chittagong, BD',
                  rating: 4.8,
                  price: r'$120',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PlaceDetailsScreen()),
                    );
                  },
                ),
                DestinationCard(
                  imageUrl: 'https://images.unsplash.com/photo-1623940173693-0182697850a5?auto=format&fit=crop&q=80&w=800',
                  title: 'Sylhet Tea Garden',
                  location: 'Sylhet, BD',
                  rating: 4.7,
                  price: r'$80',
                  onTap: () {},
                ),
                DestinationCard(
                  imageUrl: 'https://images.unsplash.com/photo-1610444583737-14e3650f9686?auto=format&fit=crop&q=80&w=800',
                  title: 'Sundarbans',
                  location: 'Khulna, BD',
                  rating: 4.9,
                  price: r'$150',
                  onTap: () {},
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildRecommendedSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended for You',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: const DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1590603740183-980e7f6920eb?auto=format&fit=crop&q=80&w=800'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ],
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sajek Valley Expedition',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(LucideIcons.mapPin, color: Colors.white70, size: 14),
                    SizedBox(width: 4),
                    Text(
                      'Rangamati, Chittagong Hill Tracts',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(LucideIcons.house), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(LucideIcons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(LucideIcons.calendar), label: 'Plan'),
            BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
