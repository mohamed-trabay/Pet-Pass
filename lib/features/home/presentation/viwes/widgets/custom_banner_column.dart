// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/assets.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/animated_image.dart';

class CustomBannerColumn extends StatelessWidget {
  const CustomBannerColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
        image: const DecorationImage(
          image: AssetImage(AssetsData.fixedBanrBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              lang.bottom_header,
              style: Styles.textStyle24.copyWith(
                color: AppColors.darkBackground,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),

            SizedBox(height: 20.h),
            FixedBannerColumn(
              imagePath: AssetsData.bottom1,
              text1: lang.bottom_bannar1,
              text2: lang.bottom_bannar11,
            ),
            FixedBannerColumn(
              imagePath: AssetsData.bottom2,
              text1: lang.bottom_bannar2,
              text2: lang.bottom_bannar22,
            ),
            FixedBannerColumn(
              imagePath: AssetsData.bottom3,
              text1: lang.bottom_bannar3,
              text2: lang.bottom_bannar33,
            ),
            FixedBannerColumn(
              imagePath: AssetsData.bottom4,
              text1: lang.bottom_bannar4,
              text2: lang.bottom_bannar44,
            ),
            SizedBox(height: 20.h),
            const AnimatedImageWidget(imagePath: AssetsData.bottommain),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

class FixedBannerColumn extends StatelessWidget {
  final String imagePath;
  final String text1;
  final String text2;

  const FixedBannerColumn({
    super.key,
    required this.imagePath,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 35.h,
            width: 35.w,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  text2,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
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
