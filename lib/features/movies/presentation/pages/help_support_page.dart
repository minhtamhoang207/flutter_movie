import 'package:flutter/material.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold_background,
      appBar: AppBar(
        title: Text(
          'Help & Support',
          style: AppStyles.s20w700.copyWith(color: AppColors.primary),
        ),
        iconTheme: const IconThemeData(color: AppColors.grey),
        backgroundColor: AppColors.scaffold_background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildSupportCard(
              icon: Icons.email,
              title: 'Email Support',
              subtitle: 'Contact us via email',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            _buildSupportCard(
              icon: Icons.phone,
              title: 'Phone Support',
              subtitle: 'Call our support team',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            _buildSupportCard(
              icon: Icons.chat,
              title: 'Live Chat',
              subtitle: 'Chat with our agents',
              onTap: () => _showComingSoon(context),
            ),
            const SizedBox(height: 16),
            _buildSupportCard(
              icon: Icons.help_center,
              title: 'FAQs',
              subtitle: 'Frequently asked questions',
              onTap: () => _showFAQs(context),
            ),
            const SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  Text(
                    'App Information',
                    style: AppStyles.s18w700.copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Version: 1.0.0',
                    style: AppStyles.s14w400.copyWith(
                      color: AppColors.grey_light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      color: AppColors.surface_cards,
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: AppStyles.s18w700.copyWith(color: AppColors.grey_light)),
        subtitle: Text(subtitle, style: AppStyles.s14w400.copyWith(color: AppColors.grey)),
        trailing: const Icon(Icons.chevron_right, color: AppColors.grey_light,),
        onTap: onTap,
      ),
    );
  }

  void _showFAQs(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface_cards,
        title: Text('FAQs', style: AppStyles.s18w700.copyWith(color: AppColors.primary)),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFAQItem(
                question: 'How do I reset my password?',
              ),
              const Divider(),
              _buildFAQItem(
                question: 'How to contact support?',
              ),
              const Divider(),
              _buildFAQItem(
                question: 'Is there a premium version?',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close', style: AppStyles.s14w400.copyWith(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem({required String question}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, style: AppStyles.s14w400.copyWith(color: AppColors.white)),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('This feature is coming soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
