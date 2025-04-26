import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAnZO-HbYIOIzEYS_uNiCS2YtyAn53nJeWbw&s'),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    'Jeon Jungkook',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),

                  SizedBox(height: 8),

                  // Email
                  Text(
                    'jeonJk@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(),
          _buildInfoTile(Icons.movie, 'My Watchlist'),
          _buildInfoTile(Icons.settings, 'Account Settings'),
          _buildInfoTile(Icons.help_outline, 'Help & Support'),
          _buildInfoTile(Icons.privacy_tip, 'Privacy Policy'),
          _buildInfoTile(Icons.logout, 'Log Out'),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
