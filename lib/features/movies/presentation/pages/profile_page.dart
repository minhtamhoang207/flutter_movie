import 'package:flutter/material.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';
import 'package:flutter_movie/features/movies/data/models/user_model.dart';
import 'package:flutter_movie/features/movies/presentation/pages/account_setting_page.dart';
import 'package:flutter_movie/features/movies/presentation/pages/help_support_page.dart';
import 'package:flutter_movie/features/movies/presentation/pages/privacy_policy_page.dart';
import 'package:flutter_movie/features/movies/presentation/pages/watchlist_page.dart';

class ProfilePage extends StatefulWidget {
  final UserProfile initialUser;
  final Function(UserProfile) onUserUpdate;

  const ProfilePage({super.key, required this.initialUser, required this.onUserUpdate});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late UserProfile user;

  @override
  void initState() {
    super.initState();
    user = widget.initialUser;
  }


  Future<void> _navigateToSettings() async {
    final updatedUser = await Navigator.push<UserProfile>(
      context,
      MaterialPageRoute(
        builder: (context) => AccountSettingPage(
          user: user,
        ),
      ),
    );

    if (updatedUser != null) {
      setState(() {
        user = updatedUser;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold_background,
      appBar: AppBar(
        backgroundColor: AppColors.scaffold_background,
        title: Text(
          'Profile',
          style: AppStyles.s20w700.copyWith(
            color: AppColors.primary,
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
                    'https://cdn.pixabay.com/photo/2022/12/02/03/34/girl-7630191_640.jpg',
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
                        color: AppColors.grey_light,
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      user.location,
                      style: AppStyles.s14w400.copyWith(
                        color: AppColors.grey_light,
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

            _buildInfoTile(Icons.settings, 'Account Settings', _navigateToSettings,),

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
      title: Text(title, style: AppStyles.s18w700.copyWith(color: AppColors.grey_light),),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.grey_light,),
      onTap: onTap,
    );
  }
}