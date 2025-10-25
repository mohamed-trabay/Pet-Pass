import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSnackbar(
  BuildContext context,
  String message, {
  bool isError = false,
}) {
  final hasHtml = message.contains('<') && message.contains('>');
  _showCustomSnackbar(context, message, isError: isError, isHtml: hasHtml);
}

void _showCustomSnackbar(
  BuildContext context,
  String message, {
  required bool isError,
  required bool isHtml,
}) {
  showTopSnackBar(
    Overlay.of(context),
    Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: isError ? AppColors.error : AppColors.corePrimary,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(20.r),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isError ? Icons.error : Icons.task_alt,
              color: Colors.white,
              size: 36.sp,
            ),
            SizedBox(width: 10.w),
            if (isHtml)
              Flexible(
                child: Html(
                  key: UniqueKey(),
                  data: message,
                  style: {
                    'body': Style(
                      margin: Margins.zero,
                      padding: HtmlPaddings.zero,
                      color: Colors.white,
                      fontSize: FontSize(15.sp),
                      textAlign: TextAlign.center,
                    ),
                  },
                ),
              )
            else
              Flexible(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
    animationDuration: const Duration(milliseconds: 600),
    displayDuration: const Duration(seconds: 2),
  );
}
