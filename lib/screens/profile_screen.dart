import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(icon: const Icon(LucideIcons.settings), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=400'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Kabin Chowdhury',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'kabin@example.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            _buildProfileSection(context, 'Account', [
              _ProfileItem(LucideIcons.user, 'Personal Information'),
              _ProfileItem(LucideIcons.creditCard, 'Payment Methods'),
              _ProfileItem(LucideIcons.bell, 'Notifications'),
            ]),
            _buildProfileSection(context, 'Travel', [
              _ProfileItem(LucideIcons.history, 'Booking History'),
              _ProfileItem(LucideIcons.heart, 'Wishlist'),
              _ProfileItem(LucideIcons.map, 'My Trips'),
            ]),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () {},
              child: const Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context, String title, List<_ProfileItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.05),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: items.map((item) => _buildItemTile(context, item)).toList(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildItemTile(BuildContext context, _ProfileItem item) {
    return ListTile(
      leading: Icon(item.icon, size: 20, color: Theme.of(context).primaryColor),
      title: Text(item.label),
      trailing: const Icon(LucideIcons.chevronRight, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}

class _ProfileItem {
  final IconData icon;
  final String label;
  _ProfileItem(this.icon, this.label);
}
