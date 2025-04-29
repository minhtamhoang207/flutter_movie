import 'package:flutter/material.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Profile',
          style: AppStyles.s20w700.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAnZO-HbYIOIzEYS_uNiCS2YtyAn53nJeWbw&s',
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Text(
                      'Jeon Jungkook',
                      style: AppStyles.s24w700.copyWith(
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Email
                    Text(
                      'jeonJk@gmail.com',
                      style: AppStyles.s16w400.copyWith(
                        color: AppColors.grey,
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
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
