// ignore_for_file: file_names, deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/app_router.dart';
import 'package:pet_pass/core/utiles/assets.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_banner.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_buttom.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Stack(
      children: [
        CarouselSlider(
          items: const [
            CustomBanner(imagePath: AssetsData.bannar1),
            CustomBanner(imagePath: AssetsData.bannar2),
            CustomBanner(imagePath: AssetsData.bannar3),
          ],
          options: CarouselOptions(
            height: 180.h,
            autoPlay: true,
            viewportFraction: 1,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
        Positioned.fill(
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.2),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start, // شمال
                children: [
                  Text(
                    lang.banner1,
                    textAlign: TextAlign.start,
                    style: Styles.textStyle18.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        lang.store,
                        textAlign: TextAlign.start,
                        style: Styles.textStyle18.copyWith(
                          color: AppColors.corePrimary,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        lang.banner11,
                        textAlign: TextAlign.start,
                        style: Styles.textStyle18.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    color: Colors.white.withOpacity(.7),
                    height: 5.h,
                    thickness: 1.5,
                    endIndent: 180.w,
                  ),

                  SizedBox(height: 10.h),
                  CustomButton(
                    fontSize: 12.sp,
                    borderColor: AppColors.corePrimary,
                    borderWidth: 2,
                    textColor: Colors.black,
                    color: Colors.white,
                    height: 35.h,
                    title: lang.banner11Button,
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kPaymentsView);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
