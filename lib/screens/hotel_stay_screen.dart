import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HotelStayScreen extends StatelessWidget {
  const HotelStayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels & Stays'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildHotelCard(context, 'Sayeman Beach Resort', 'Cox\'s Bazar', 4.7, r'$200', 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800'),
          _buildHotelCard(context, 'Grand Sultan Resort', 'Sylhet', 4.9, r'$250', 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800'),
          _buildHotelCard(context, 'Ocean Paradise Hotel', 'Cox\'s Bazar', 4.5, r'$180', 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=800'),
        ],
      ),
    );
  }

  Widget _buildHotelCard(BuildContext context, String name, String location, double rating, String price, String imageUrl) {
    return Container(
      margin: const EdgeInsets.bottom(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(LucideIcons.star, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(LucideIcons.mapPin, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(location, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _AmenityIcon(LucideIcons.wifi),
                        _AmenityIcon(LucideIcons.coffee),
                        _AmenityIcon(LucideIcons.waves),
                      ],
                    ),
                    Text(
                      '$price/night',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
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

class _AmenityIcon extends StatelessWidget {
  final IconData icon;
  const _AmenityIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 16, color: Colors.grey[600]),
    );
  }
}
