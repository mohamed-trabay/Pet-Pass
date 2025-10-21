import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';

class AuthBackground extends StatelessWidget {
  final bool isDark;
  const AuthBackground({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isDark ? AppColors.darkBackground : const Color(0xFFFFF8F0),
            isDark ? AppColors.darkBackground : Colors.white,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 80.h,
            right: 20.w,
            child: Opacity(
              opacity: 0.1,
              child: Text('🐾', style: TextStyle(fontSize: 90.sp)),
            ),
          ),
          Positioned(
            bottom: 60.h,
            right: 20.w,
            child: Opacity(
              opacity: 0.2,
              child: Text('🐈‍⬛', style: TextStyle(fontSize: 30.sp)),
            ),
          ),
          Positioned(
            bottom: 200.h,
            left: 20.w,
            child: Opacity(
              opacity: 0.1,
              child: Text('🐾', style: TextStyle(fontSize: 90.sp)),
            ),
          ),
        ],
      ),
    );
  }
}
