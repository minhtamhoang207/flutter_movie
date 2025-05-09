import 'package:flutter/material.dart';
import 'package:flutter_movie/common/app_theme/app_colors.dart';
import 'package:flutter_movie/common/app_theme/app_text_styles.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: AppStyles.s20w700.copyWith(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.primary,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. Information We Collect',
              style: AppStyles.s18w700,
            ),
            SizedBox(height: 10),
            Text(
              'We may collect personal information such as your name, email address, and usage data when you use our application.',
              style: AppStyles.s16w400,
            ),
            SizedBox(height: 20),
            Text(
              '2. How We Use Your Information',
              style: AppStyles.s18w700,
            ),
            SizedBox(height: 10),
            Text(
              'We use the information to provide and improve our services, to communicate with you, and for analytics purposes.',
              style: AppStyles.s16w400,
            ),
            SizedBox(height: 20),
            Text(
              '3. Data Security',
              style: AppStyles.s18w700,
            ),
            SizedBox(height: 10),
            Text(
              'We implement appropriate security measures to protect your personal information from unauthorized access.',
              style: AppStyles.s16w400,
            ),
            SizedBox(height: 20),
            Text(
              '4. Changes to This Policy',
              style: AppStyles.s18w700,
            ),
            SizedBox(height: 10),
            Text(
              'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new policy on this page.',
              style: AppStyles.s16w400,
            ),
            SizedBox(height: 20),
            Text(
              '5. Contact Us',
              style: AppStyles.s18w700,
            ),
            SizedBox(height: 10),
            Text(
              'If you have any questions about this Privacy Policy, please contact us at privacy@example.com.',
              style: AppStyles.s16w400,
            ),
          ],
        ),
      ),
    );
  }
}
