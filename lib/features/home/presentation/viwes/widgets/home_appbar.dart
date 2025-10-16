// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_pass/core/utiles/app_router.dart';
import 'package:pet_pass/core/utiles/assets.dart';
import 'package:pet_pass/core/widgets/custom_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  final int notificationCount;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onNotificationPressed;

  const HomeAppBar({
    super.key,
    this.notificationCount = 1,
    this.onSearchPressed,
    this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Search Icon with background
          CustomIconButton(
            icon: Icons.account_circle_outlined,
            onPressed:
                onNotificationPressed ??
                () {
                  GoRouter.of(context).push(AppRouter.kPrpfielView);
                },
            isDark: isDark,
          ),

          // Logo
          Expanded(
            child: Center(
              child: Image.asset(
                isDark ? AssetsData.darklogo : AssetsData.logo,
                height: 60.h,
                width: 120.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
          CustomIconButton(
            icon: Icons.search,
            onPressed:
                onSearchPressed ??
                () {
                  GoRouter.of(context).push(AppRouter.kSerchView);
                },
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}
