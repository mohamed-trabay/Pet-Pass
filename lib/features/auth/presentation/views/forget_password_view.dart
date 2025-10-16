import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/app_logo.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_buttom.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          // 🌈 الخلفية الجمالية
          Container(
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
          ),

          // 🐾 رسومات الخلفية
          Positioned(
            top: 80.h,
            right: 30.w,
            child: Opacity(
              opacity: 0.1,
              child: Text('🐾', style: TextStyle(fontSize: 70.sp)),
            ),
          ),
          Positioned(
            bottom: 50.h,
            right: 55.w,
            left: 55.w,
            child: Opacity(
              opacity: 0.1,
              child: Text('🐱🐶🐕🐈‍⬛', style: TextStyle(fontSize: 40.sp)),
            ),
          ),

          // 🧱 المحتوى
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 80.h),
                const AppLogo(),
                SizedBox(height: 20.h),

                // 📝 العنوان
                Text(
                  lang.forgotPassword,
                  style: Styles.textStyle24.copyWith(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  lang.enterYourEmail,
                  style: Styles.textStyle14.copyWith(
                    color: AppColors.greyprimmary,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 40.h),

                // 📧 إدخال الإيميل
                AuthTextField(
                  hintText: lang.email,
                  icon: Icons.email_outlined,
                  onChanged: (v) {},
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                ),

                SizedBox(height: 30.h),

                // 🚀 زرار الإرسال
                CustomButton(
                  width: double.infinity,
                  height: 55.h,
                  title: 'Send Reset Link',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password reset link sent to your email'),
                      ),
                    );
                    GoRouter.of(context).pop();
                  },
                ),

                SizedBox(height: 25.h),

                // 🔙 الرجوع لتسجيل الدخول
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  child: Text(
                    'Back to Login',
                    style: Styles.textStyle12.copyWith(
                      color: AppColors.greyprimmary,
                    ),
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
