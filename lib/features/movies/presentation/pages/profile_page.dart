// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';
import 'package:flutter_movie/features/movies/data/models/user_model.dart';
import 'package:flutter_movie/features/movies/presentation/pages/account_setting_page.dart';
import 'package:flutter_movie/features/movies/presentation/pages/help_support_page.dart';
import 'package:flutter_movie/features/movies/presentation/pages/privacy_policy_page.dart';
import 'package:flutter_movie/features/movies/presentation/pages/watchlist_page.dart';

class ProfilePage extends StatelessWidget {
  final UserProfile user;

  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
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
                CircleAvatar(
                  radius: 60,
                  backgroundImage: user.profileImage != null
                      ? FileImage(user.profileImage!)
                      : const NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAnZO-HbYIOIzEYS_uNiCS2YtyAn53nJeWbw&s',
                  ) as ImageProvider,
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Text(
                      user.name,
                      style: AppStyles.s24w700.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user.email,
                      style: AppStyles.s16w400.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      user.location,
                      style: AppStyles.s14w400.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Divider(),
            _buildInfoTile(Icons.movie, 'My Watchlist', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WatchList()),
              );
            }),
            _buildInfoTile(Icons.settings, 'Account Settings', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountSettingPage(
                    user: user,
                    onSave: (updatedUser) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(user: updatedUser),
                        ),
                      );
                    },
                    onCancel: ()
                    {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ).then((updatedUser) {
                if (updatedUser != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(user: updatedUser),
                    ),
                  );
                }
              });
            }),
            _buildInfoTile(Icons.help_outline, 'Help & Support', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpSupportPage(),
                ),
              );
            }),
            _buildInfoTile(Icons.privacy_tip, 'Privacy Policy', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyPage(),
                ),
              );
            }),
            _buildInfoTile(Icons.logout, 'Log Out', () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}