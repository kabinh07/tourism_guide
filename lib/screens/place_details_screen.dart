import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../core/constants/destination_images.dart';
import '../features/destination/data/repositories/destination_repository_impl.dart';
import '../features/research/data/services/research_aggregator.dart';
import '../features/research/domain/entities/information_cards.dart';

class PlaceDetailsScreen extends ConsumerWidget {
  final int destinationId;

  const PlaceDetailsScreen({super.key, required this.destinationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final destAsync = ref.watch(destinationByIdProvider(destinationId));
    final cardsAsync = ref.watch(destinationInfoCardsProvider(destinationId));

    return Scaffold(
      body: destAsync.when(
        data: (dest) {
          if (dest == null) {
            return const Center(child: Text('Destination not found'));
          }
          return _DetailsBody(
            destinationId: destinationId,
            imageUrl: dest.imageUrl,
            name: dest.name ?? '',
            district: dest.district ?? '',
            division: dest.division ?? '',
            rating: dest.popularityScore ?? 0.0,
            budget: dest.estimatedBudget,
            cardsAsync: cardsAsync,
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

class _DetailsBody extends StatelessWidget {
  final int destinationId;
  final String? imageUrl;
  final String name;
  final String district;
  final String division;
  final double rating;
  final double? budget;
  final AsyncValue<DestinationInfoCards> cardsAsync;

  const _DetailsBody({
    required this.destinationId,
    this.imageUrl,
    required this.name,
    required this.district,
    required this.division,
    required this.rating,
    required this.budget,
    required this.cardsAsync,
  });

  @override
  Widget build(BuildContext context) {
    final heroHeight = MediaQuery.of(context).size.height * 0.45;
    final cardHeight = MediaQuery.of(context).size.height * 0.60;

    return DefaultTabController(
      length: 5,
      child: Stack(
        children: [
          // Hero image
          SizedBox(
            height: heroHeight,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: destinationImageUrl(destinationId, large: true, dbImageUrl: imageUrl),
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(color: Colors.grey[300]),
              errorWidget: (context, url, error) => Container(color: Colors.grey[300]),
            ),
          ),
          // Back + favourite buttons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconBtn(context, LucideIcons.chevronLeft,
                      () => context.pop()),
                  _iconBtn(context, LucideIcons.heart, () {}),
                ],
              ),
            ),
          ),
          // Content card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: cardHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(36)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withValues(alpha: 0.1), // 10% Floating shadow
                    blurRadius: 24,
                    offset: const Offset(0, -8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(fontSize: 26),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(LucideIcons.mapPin,
                                      size: 14, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(
                                    '$district, $division',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.amber.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(LucideIcons.star,
                                  size: 15, color: Colors.amber),
                              const SizedBox(width: 4),
                              Text(rating.toStringAsFixed(1),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Theme.of(context).colorScheme.outline,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.12),
                    ),
                    dividerColor: Colors.transparent,
                    tabs: const [
                      Tab(text: 'Overview'),
                      Tab(text: 'Getting There'),
                      Tab(text: 'Stay'),
                      Tab(text: 'Food & Activities'),
                      Tab(text: 'Tips'),
                    ],
                  ),
                  Expanded(
                    child: cardsAsync.when(
                      data: (cards) => _TabContent(
                          cards: cards, destinationId: destinationId, budget: budget),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (err, _) =>
                          Center(child: Text('Error: $err')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconBtn(
      BuildContext context, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.85),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: Colors.black87),
      ),
    );
  }
}

class _TabContent extends StatelessWidget {
  final DestinationInfoCards cards;
  final int destinationId;
  final double? budget;

  const _TabContent(
      {required this.cards, required this.destinationId, required this.budget});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        _OverviewTab(cards.overview),
        _TravelTab(cards.travelGuide),
        _StayTab(cards.stay, destinationId: destinationId),
        _FoodTab(cards.foodActivity),
        _TipsTab(cards.recentInsights, summary: cards.aiSummary, budget: budget),
      ],
    );
  }
}

// ── Tab: Overview ──────────────────────────────────────────────────────────────
class _OverviewTab extends StatelessWidget {
  final OverviewCardState card;
  const _OverviewTab(this.card);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _InfoRow(LucideIcons.calendar, 'Best Time', card.bestTime),
        _InfoRow(LucideIcons.clock, 'Ideal Duration', card.idealDuration),
        _InfoRow(LucideIcons.banknote, 'Estimated Budget',
            card.estimatedTotalBudget),
      ],
    );
  }
}

// ── Tab: Getting There ─────────────────────────────────────────────────────────
class _TravelTab extends StatelessWidget {
  final TravelGuideCardState card;
  const _TravelTab(this.card);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _InfoRow(LucideIcons.navigation, 'How to Go', card.howToGo),
        _InfoRow(LucideIcons.bus, 'Transport Details', card.transportDetails),
        _InfoRow(LucideIcons.circleDollarSign, 'Approximate Cost',
            card.approxTransportCost),
      ],
    );
  }
}

// ── Tab: Stay ──────────────────────────────────────────────────────────────────
class _StayTab extends StatelessWidget {
  final StayCardState card;
  final int destinationId;
  const _StayTab(this.card, {required this.destinationId});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      children: [
        for (final group in card.groups) ...[
          Text(
            group.type[0].toUpperCase() + group.type.substring(1),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          for (final acc in group.options)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(acc.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(acc.priceRange,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600)),
                  if (acc.amenities.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: acc.amenities
                          .map((a) => Chip(
                                label: Text(a,
                                    style: const TextStyle(fontSize: 11)),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                side: BorderSide(color: Colors.grey[300]!),
                              ))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          const SizedBox(height: 8),
        ],
        ElevatedButton.icon(
          onPressed: () => context.go('/place/$destinationId/hotels'),
          icon: const Icon(LucideIcons.hotel),
          label: const Text('View All Hotels'),
        ),
      ],
    );
  }
}

// ── Tab: Food & Activities ─────────────────────────────────────────────────────
class _FoodTab extends StatelessWidget {
  final FoodActivityCardState card;
  const _FoodTab(this.card);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        if (card.activities.isNotEmpty) ...[
          const Text('Activities',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: card.activities
                .map((a) => Chip(
                      avatar: const Icon(LucideIcons.zap, size: 14),
                      label: Text(a),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
        ],
        if (card.foodHighlights.isNotEmpty) ...[
          const Text('Food Highlights',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          for (final f in card.foodHighlights)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(LucideIcons.utensils,
                      size: 14, color: Colors.orange),
                  const SizedBox(width: 8),
                  Expanded(child: Text(f)),
                ],
              ),
            ),
        ],
      ],
    );
  }
}

// ── Tab: Tips ──────────────────────────────────────────────────────────────────
class _TipsTab extends StatelessWidget {
  final RecentInsightsCardState card;
  final AISummaryCardState summary;
  final double? budget;
  const _TipsTab(this.card, {required this.summary, required this.budget});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        if (card.warnings.isNotEmpty) ...[
          _insightSection(context, 'Warnings', LucideIcons.triangleAlert,
              Colors.orange, card.warnings),
          const SizedBox(height: 16),
        ],
        if (card.scams.isNotEmpty) ...[
          _insightSection(context, 'Watch Out For', LucideIcons.shieldAlert,
              Colors.red, card.scams),
          const SizedBox(height: 16),
        ],
        if (card.trends.isNotEmpty) ...[
          _insightSection(context, 'Trends & Tips', LucideIcons.trendingUp,
              Colors.green, card.trends),
          const SizedBox(height: 16),
        ],
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(LucideIcons.sparkles,
                      size: 16, color: Theme.of(context).primaryColor),
                  const SizedBox(width: 6),
                  const Text('AI Summary',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Text(summary.summary,
                  style: const TextStyle(height: 1.5, color: Colors.black87)),
            ],
          ),
        ),
        if (budget != null) ...[
          const SizedBox(height: 24),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Est. Budget',
                      style: TextStyle(color: Colors.grey)),
                  Text(
                    '${budget!.toStringAsFixed(0)} BDT',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.tertiary, // Sunset Orange
                        Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text('Book Now',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _insightSection(BuildContext context, String title, IconData icon,
      Color color, List<InsightEntry> entries) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: color)),
          ],
        ),
        const SizedBox(height: 8),
        for (final e in entries)
          Padding(
            padding: const EdgeInsets.only(bottom: 6, left: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                      color: color, shape: BoxShape.circle),
                ),
                const SizedBox(width: 8),
                Expanded(child: Text(e.content)),
              ],
            ),
          ),
      ],
    );
  }
}

// ── Shared helper ──────────────────────────────────────────────────────────────
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoRow(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 18, color: Theme.of(context).primaryColor),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 2),
                Text(value,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
