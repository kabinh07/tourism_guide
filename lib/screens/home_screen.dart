import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../core/constants/destination_images.dart';
import '../features/destination/data/repositories/destination_repository_impl.dart';
import '../features/recommendation/domain/services/recommendation_engine.dart';
import '../widgets/category_chip.dart';
import '../widgets/destination_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: SingleChildScrollView(
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
              _buildFeaturedSection(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
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
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => context.go('/profile'),
          child: CircleAvatar(
            radius: 24,
            backgroundColor:
                Theme.of(context).primaryColor.withValues(alpha: 0.1),
            child: Icon(LucideIcons.user, color: Theme.of(context).primaryColor),
          ),
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
            color: Theme.of(context).primaryColor.withValues(alpha: 0.04), // 4% primary color subtle shadow
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          icon: Icon(LucideIcons.compass, color: Theme.of(context).colorScheme.onSurfaceVariant),
          hintText: 'Search destinations, hotels...',
          border: InputBorder.none,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.outline),
        ),
        onSubmitted: (query) {
          if (query.trim().isNotEmpty) {
            context.go('/search?q=${Uri.encodeComponent(query.trim())}');
          }
        },
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    final tagsAsync = ref.watch(allDestinationTagsProvider);
    final selected = ref.watch(selectedCategoryProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categories', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        tagsAsync.when(
          data: (tags) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: tags
                  .map((cat) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: CategoryChip(
                          label: cat,
                          isActive: selected == cat,
                          onTap: () =>
                              ref.read(selectedCategoryProvider.notifier).state =
                                  cat,
                        ),
                      ))
                  .toList(),
            ),
          ),
          loading: () => const SizedBox(height: 44),
          error: (_, __) => const SizedBox(height: 44),
        ),
      ],
    );
  }

  Widget _buildPopularSection(BuildContext context) {
    final popularAsync = ref.watch(popularDestinationsProvider);
    final selected = ref.watch(selectedCategoryProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Popular Destinations',
                style: Theme.of(context).textTheme.headlineMedium),
            GestureDetector(
              onTap: () => context.go('/search'),
              child: Text(
                'See All',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        popularAsync.when(
          data: (destinations) {
            final filtered = selected == 'All'
                ? destinations
                : destinations
                    .where((d) => d.tags?.any((t) =>
                            t.toLowerCase() == selected.toLowerCase()) ==
                        true)
                    .toList();
            if (filtered.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Text('No destinations in this category',
                      style: TextStyle(color: Colors.grey)),
                ),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filtered
                    .map((dest) => DestinationCard(
                          imageUrl: destinationImageUrl(dest.id, dbImageUrl: dest.imageUrl),
                          title: dest.name ?? '',
                          location: '${dest.district ?? ''}, BD',
                          rating: dest.popularityScore ?? 0.0,
                          price: '${dest.estimatedBudget?.toStringAsFixed(0) ?? '?'} BDT',
                          onTap: () => context.go('/place/${dest.id}'),
                        ))
                    .toList(),
              ),
            );
          },
          loading: () => const SizedBox(
              height: 220,
              child: Center(child: CircularProgressIndicator())),
          error: (err, _) =>
              SizedBox(height: 60, child: Center(child: Text('$err'))),
        ),
      ],
    );
  }

  Widget _buildFeaturedSection(BuildContext context) {
    final popularAsync = ref.watch(popularDestinationsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recommended for You',
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        popularAsync.when(
          data: (destinations) {
            if (destinations.isEmpty) return const SizedBox.shrink();
            final featured = destinations.last;
            return GestureDetector(
              onTap: () => context.go('/place/${featured.id}'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: destinationImageUrl(featured.id, dbImageUrl: featured.imageUrl),
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: Colors.grey[200],
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[200],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.85),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.7],
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            featured.name ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(LucideIcons.mapPin,
                                  color: Colors.white70, size: 14),
                              const SizedBox(width: 4),
                              Text(
                                '${featured.district ?? ''}, ${featured.division ?? ''}',
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          loading: () => Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          error: (_, __) => const SizedBox.shrink(),
        ),
      ],
    );
  }
}
