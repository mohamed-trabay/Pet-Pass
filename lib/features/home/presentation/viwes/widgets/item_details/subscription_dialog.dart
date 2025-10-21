import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/app_router.dart';
import 'package:pet_pass/core/utiles/styles.dart';

// ignore: non_constant_identifier_names
void SubscriptionDialog(BuildContext context, AppLocalizations lang) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Row(
            children: [
              Icon(Icons.lock, color: AppColors.primary, size: 28.r),
              SizedBox(width: 8.w),
              Text(
                'Subscription Required',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(
            'You need an active subscription to view item details. Subscribe now to unlock all features!',
            style: Styles.textStyle14,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: Styles.textStyle14.copyWith(
                  color: AppColors.greyprimmary,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                GoRouter.of(context).push(AppRouter.kPaymentsView);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Subscribe Now',
                style: Styles.textStyle14.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
  );
}
