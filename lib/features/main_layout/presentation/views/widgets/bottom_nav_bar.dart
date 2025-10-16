import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as custom_badge;
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final int favCount;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.favCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.background(context),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor(context),
            blurRadius: 8,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.home_outlined, lang.home, 0),
          _buildNavItem(context, Icons.percent_outlined, lang.store, 1),
          _buildNavItem(
            context,
            Icons.favorite_outline,
            lang.fav,
            badgeCount: favCount,

            2,
          ),
          _buildNavItem(context, Icons.paid_outlined, lang.premium, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    int index, {
    int badgeCount = 0,
  }) {
    final isSelected = index == currentIndex;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final selectedColor = AppColors.corePrimary;
    final unselectedColor = isDark ? Colors.grey[400]! : Colors.grey[700]!;

    return GestureDetector(
      onTap: () => onTap(index),
      child: custom_badge.Badge(
        showBadge: badgeCount > 0,
        badgeStyle: const custom_badge.BadgeStyle(
          badgeColor: AppColors.corePrimary,
        ),
        badgeContent: Text(
          '$badgeCount',
          style: TextStyle(color: Colors.white, fontSize: 10.sp),
        ),
        position: custom_badge.BadgePosition.topEnd(top: 12, end: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? selectedColor : unselectedColor),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? selectedColor : unselectedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
