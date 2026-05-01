import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/destination/data/repositories/destination_repository_impl.dart';

class HotelStayScreen extends ConsumerWidget {
  final int destinationId;

  const HotelStayScreen({super.key, required this.destinationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accommodationsAsync = ref.watch(accommodationsForDestinationProvider(destinationId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels & Stays'),
      ),
      body: accommodationsAsync.when(
        data: (accommodations) {
          if (accommodations.isEmpty) {
            return const Center(
              child: Text('No accommodations found'),
            );
          }

          final grouped = <String, List<dynamic>>{};
          for (final acc in accommodations) {
            final type = acc.type ?? 'other';
            grouped.putIfAbsent(type, () => []).add(acc);
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              for (final type in ['budget', 'mid-range', 'resort'])
                if (grouped.containsKey(type))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          type.replaceFirst(type[0], type[0].toUpperCase()),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ...grouped[type]!.map((acc) => _buildHotelCard(context, acc)),
                    ],
                  ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildHotelCard(BuildContext context, dynamic acc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    acc.name ?? 'Hotel',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withValues(alpha:0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    acc.type ?? 'Hotel',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              acc.priceRange ?? 'Price not available',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if ((acc.amenities ?? []).isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: (acc.amenities ?? [])
                    .map((amenity) => Chip(
                          label: Text(amenity),
                          side: BorderSide(color: Colors.grey[300]!),
                        ))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
