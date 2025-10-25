import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/utiles/assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Theme.of(context).brightness == Brightness.dark
            ? AssetsData.darklogo
            : AssetsData.logo,
        width: 220.w,
        height: 220.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
