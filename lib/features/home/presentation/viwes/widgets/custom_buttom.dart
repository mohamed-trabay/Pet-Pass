import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/styles.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
    this.width,
    this.color,
    this.textColor,
    this.borderColor,
    this.borderWidth,
    this.fontSize,
  });

  final String title;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;

  final Color? borderColor;
  final double? borderWidth;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.coreGold,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
        ),
        minimumSize: Size(width ?? 0, height ?? 24.h),
        padding: EdgeInsets.symmetric(horizontal: 15.r),
      ),
      child: Text(
        title,
        style: Styles.textStyle14.copyWith(
          fontWeight: FontWeight.w700,
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? Styles.textStyle14.fontSize,
        ),
      ),
    );
  }
}
