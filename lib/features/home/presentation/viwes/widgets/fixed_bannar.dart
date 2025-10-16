import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/assets.dart';

class FixedBanner extends StatelessWidget {
  const FixedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
        image: const DecorationImage(
          image: AssetImage(AssetsData.fixedBanrBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FixedBannerColumn(
              imagePath: AssetsData.fixedBanr1,
              text: lang.fixedBanner1,
            ),
            FixedBannerColumn(
              imagePath: AssetsData.fixedBanr2,
              text: lang.fixedBanner2,
            ),
            FixedBannerColumn(
              imagePath: AssetsData.fixedBanr3,
              text: lang.fixedBanner3,
            ),
          ],
        ),
      ),
    );
  }
}

class FixedBannerColumn extends StatelessWidget {
  final String imagePath;
  final String text;
  const FixedBannerColumn({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 30.h,
            width: 30.w,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 6.h),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
