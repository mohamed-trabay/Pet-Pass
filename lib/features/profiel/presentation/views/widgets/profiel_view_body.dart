import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/app_router.dart';
import 'package:pet_pass/core/utiles/assets.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/core/widgets/custom_app_bar.dart';

class ProfielViewBody extends StatelessWidget {
  const ProfielViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return ListView(
      padding: EdgeInsets.all(20.r),
      children: [
        CustomAppBar(title: lang.profile),
        SizedBox(height: 10.h),
        _buildProfileHeader(context),
        const Divider(
          thickness: 1,
          color: Colors.grey,
          endIndent: 20,
          indent: 20,
        ),
        CustomDrawerItem(
          icon: Icons.shopping_bag_outlined,
          title: lang.pastOrders,
          onTap: () => Navigator.pop(context),
        ),
        CustomDrawerItem(
          icon: Icons.replay_outlined,
          title: lang.refund,
          onTap: () {},
        ),
        CustomDrawerItem(
          icon: Icons.settings_outlined,
          title: lang.settings,
          onTap: () {
            GoRouter.of(context).push(AppRouter.ksettingsView);
          },
        ),
        CustomDrawerItem(
          icon: Icons.privacy_tip_outlined,
          title: lang.privacy,
          onTap: () {},
        ),
        CustomDrawerItem(
          icon: Icons.description_outlined,
          title: lang.terms,
          onTap: () {},
        ),
        CustomDrawerItem(
          icon: Icons.info_outline,
          title: lang.aboutUs,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Container(
      padding: EdgeInsets.all(16.r),
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
            height: 60.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage(AssetsData.profielUser),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lang.userName,
                  style: Styles.textStyle18.copyWith(color: Colors.grey),
                ),
                Text(
                  'User@gmail.com',
                  style: Styles.textStyle14.copyWith(
                    color: AppColors.greyprimmary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
