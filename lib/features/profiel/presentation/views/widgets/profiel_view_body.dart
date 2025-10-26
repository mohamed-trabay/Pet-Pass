import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_router.dart';

import 'package:pet_pass/core/widgets/custom_app_bar.dart';

import 'package:pet_pass/features/profiel/presentation/views/widgets/custom_profiel_item.dart';
import 'package:pet_pass/features/profiel/presentation/views/widgets/logout_dialog.dart';
import 'package:pet_pass/features/profiel/presentation/views/widgets/profile_header.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfielViewBody extends StatelessWidget {
  const ProfielViewBody({super.key});
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return ListView(
      padding: EdgeInsets.all(20.r),
      children: [
        CustomAppBar(title: lang.profile),
        SizedBox(height: 10.h),
        const ProfileHeader(),
        const Divider(
          thickness: 1,
          color: Colors.grey,
          endIndent: 20,
          indent: 20,
        ),
        CustomProfielItem(
          icon: Icons.handshake_outlined,
          title: 'Become a partner',
          onTap: () => _launchURL('https://petpass.ae/become-a-partner/'),
        ),
        CustomProfielItem(
          icon: Icons.settings_outlined,
          title: lang.settings,
          onTap: () {
            GoRouter.of(context).push(AppRouter.ksettingsView);
          },
        ),
        CustomProfielItem(
          icon: Icons.privacy_tip_outlined,
          title: lang.privacy,
          onTap: () {
            _launchURL('https://petpass.ae/policy/');
          },
        ),
        CustomProfielItem(
          icon: Icons.help_outline,
          title: 'How it works',
          onTap: () {
            _launchURL('https://petpass.ae/how-it-works/');
          },
        ),
        CustomProfielItem(
          icon: Icons.group_outlined,
          title: 'Founding members',
          onTap: () {
            _launchURL('https://petpass.ae/founding-members/');
          },
        ),
        Divider(thickness: 1.h, color: Colors.grey[300]),
        ListTile(
          leading: const Icon(Icons.logout_outlined, color: Colors.red),
          title: Text(lang.logout, style: const TextStyle(color: Colors.red)),
          onTap: () {
            showLogoutDialog(context);
          },
        ),
      ],
    );
  }
}
