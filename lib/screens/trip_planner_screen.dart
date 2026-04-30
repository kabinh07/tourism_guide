import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TripPlannerScreen extends StatelessWidget {
  const TripPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Planner'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Plan Your Journey', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 8),
            const Text('Customize your itinerary for a perfect trip.', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 32),
            _buildSelectionTile(context, LucideIcons.map, 'Destination', 'Select a city or place'),
            _buildSelectionTile(context, LucideIcons.calendar, 'Dates', 'Choose trip duration'),
            _buildSelectionTile(context, LucideIcons.users, 'Travelers', 'Number of people'),
            const SizedBox(height: 40),
            Text('Recent Plans', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            _buildRecentPlan(context, 'Summer Vacation', 'Cox\'s Bazar', 'May 15 - May 20'),
            _buildRecentPlan(context, 'Adventure Trip', 'Sylhet', 'June 10 - June 14'),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text('Generate Itinerary', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionTile(BuildContext context, IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Theme.of(context).primaryColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const Icon(LucideIcons.chevronRight, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildRecentPlan(BuildContext context, String name, String location, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('$location • $date', style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          Icon(LucideIcons.ellipsisVertical, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
