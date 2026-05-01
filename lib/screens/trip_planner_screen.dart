import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../core/constants/destination_images.dart';
import '../features/destination/data/models/destination.dart';
import '../features/recommendation/domain/entities/user_preferences.dart';
import '../features/recommendation/domain/services/recommendation_engine.dart';

class TripPlannerScreen extends ConsumerStatefulWidget {
  const TripPlannerScreen({super.key});

  @override
  ConsumerState<TripPlannerScreen> createState() => _TripPlannerScreenState();
}

class _TripPlannerScreenState extends ConsumerState<TripPlannerScreen> {
  double _budget = 8000;
  int _days = 3;
  int _people = 2;
  final Set<String> _selectedTags = {};
  UserPreferences? _submittedPrefs;

  static const _allTags = [
    'beach', 'mountain', 'forest', 'hills', 'nature', 'tea',
    'sea', 'lake', 'tribal', 'spiritual', 'wetland', 'island',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trip Planner')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Plan Your Journey',
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 4),
            const Text('Set your preferences and find perfect destinations.',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 28),
            _buildBudgetSlider(context),
            const SizedBox(height: 24),
            _buildDaysSelector(context),
            const SizedBox(height: 24),
            _buildPeopleStepper(context),
            const SizedBox(height: 24),
            _buildTagSelector(context),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => setState(() {
                  _submittedPrefs = UserPreferences(
                    maxBudget: _budget,
                    tripDays: _days,
                    peopleCount: _people,
                    preferredTags: _selectedTags.toList(),
                  );
                }),
                icon: const Icon(LucideIcons.compass),
                label: const Text('Find Destinations',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            if (_submittedPrefs != null) ...[
              const SizedBox(height: 32),
              _buildResults(context, _submittedPrefs!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetSlider(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Max Budget',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${_budget.toStringAsFixed(0)} BDT',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Slider(
          value: _budget,
          min: 1000,
          max: 20000,
          divisions: 38,
          label: '${_budget.toStringAsFixed(0)} BDT',
          onChanged: (v) => setState(() => _budget = v),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1,000', style: TextStyle(fontSize: 11, color: Colors.grey)),
            Text('20,000', style: TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildDaysSelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Trip Duration',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 10),
        Row(
          children: List.generate(7, (i) {
            final day = i + 1;
            final active = _days == day;
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _days = day),
                child: Container(
                  margin: const EdgeInsets.only(right: 6),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: active
                        ? Theme.of(context).primaryColor
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$day',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: active ? Colors.white : Colors.black87,
                        ),
                      ),
                      Text(
                        day == 1 ? 'day' : 'days',
                        style: TextStyle(
                          fontSize: 10,
                          color: active ? Colors.white70 : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildPeopleStepper(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Travelers',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15)),
              Text('Number of people',
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed:
                  _people > 1 ? () => setState(() => _people--) : null,
              icon: const Icon(LucideIcons.minus),
              style: IconButton.styleFrom(
                  backgroundColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('$_people',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            IconButton(
              onPressed: () => setState(() => _people++),
              icon: const Icon(LucideIcons.plus),
              style: IconButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTagSelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Interests',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const Text('Select what you enjoy',
            style: TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _allTags.map((tag) {
            final active = _selectedTags.contains(tag);
            return FilterChip(
              label: Text(tag),
              selected: active,
              onSelected: (val) => setState(() {
                if (val) {
                  _selectedTags.add(tag);
                } else {
                  _selectedTags.remove(tag);
                }
              }),
              selectedColor:
                  Theme.of(context).primaryColor.withValues(alpha: 0.15),
              checkmarkColor: Theme.of(context).primaryColor,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildResults(BuildContext context, UserPreferences prefs) {
    final resultsAsync = ref.watch(recommendedDestinationsProvider(prefs));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recommended for You',
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 4),
        Text(
          '${_budget.toStringAsFixed(0)} BDT • $_days days • $_people people',
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
        const SizedBox(height: 16),
        resultsAsync.when(
          data: (destinations) {
            if (destinations.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Text('No destinations match your preferences.',
                      style: TextStyle(color: Colors.grey)),
                ),
              );
            }
            return Column(
              children: destinations
                  .take(6)
                  .map((d) => _RecommendationCard(
                        destination: d,
                        budget: prefs.maxBudget,
                        onTap: () => context.go('/place/${d.id}'),
                      ))
                  .toList(),
            );
          },
          loading: () =>
              const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(child: Text('Error: $err')),
        ),
      ],
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  final Destination destination;
  final double budget;
  final VoidCallback onTap;

  const _RecommendationCard({
    required this.destination,
    required this.budget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final withinBudget = (destination.estimatedBudget ?? 0) <= budget;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                destinationImageUrl(destination.id),
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[200],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(destination.name ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 2),
                  Text('${destination.district ?? ''}, BD',
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(LucideIcons.star,
                          size: 13, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                          (destination.popularityScore ?? 0)
                              .toStringAsFixed(1),
                          style: const TextStyle(fontSize: 13)),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: withinBudget
                              ? Colors.green.withValues(alpha: 0.1)
                              : Colors.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${destination.estimatedBudget?.toStringAsFixed(0) ?? '?'} BDT',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: withinBudget ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(LucideIcons.chevronRight,
                size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
