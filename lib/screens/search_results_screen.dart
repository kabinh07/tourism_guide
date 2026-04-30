import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:tourism_guide/widgets/destination_card.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
        actions: [
          IconButton(icon: const Icon(LucideIcons.slidersHorizontal), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildResultItem(context, 'Cox\'s Bazar', 'Beach Resort', 4.8, r'$120', 'https://images.unsplash.com/photo-1596422846543-75c6fc18a594?w=800'),
          _buildResultItem(context, 'Inani Beach', 'Natural Beach', 4.5, r'$90', 'https://images.unsplash.com/photo-1590603740183-980e7f6920eb?w=800'),
          _buildResultItem(context, 'St. Martin\'s Island', 'Coral Island', 4.9, r'$150', 'https://images.unsplash.com/photo-1610444583737-14e3650f9686?w=800'),
          _buildResultItem(context, 'Patenga Beach', 'City Beach', 4.2, r'$60', 'https://images.unsplash.com/photo-1623940173693-0182697850a5?w=800'),
        ],
      ),
    );
  }

  Widget _buildResultItem(BuildContext context, String title, String category, double rating, String price, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  category,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(LucideIcons.star, size: 14, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(rating.toString()),
                      ],
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
