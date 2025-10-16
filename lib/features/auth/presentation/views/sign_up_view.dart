import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/app_logo.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/auth_snack_bar.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_buttom.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          // الخلفية المتدرجة
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

          // رموز ديكورية
          Positioned(
            top: 100.h,
            right: 20.w,
            child: Opacity(
              opacity: 0.1,
              child: Text('🐾', style: TextStyle(fontSize: 90.sp)),
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

          // المحتوى الرئيسي
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                const AppLogo(),
                SizedBox(height: 20.h),

                Text(
                  lang.createYourAccount,
                  style: Styles.textStyle24.copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  lang.signUpToContinue,
                  style: Styles.textStyle14.copyWith(
                    color: AppColors.greyprimmary,
                  ),
                ),
                SizedBox(height: 40.h),

                // الاسم
                AuthTextField(
                  hintText: lang.fullName,
                  icon: Icons.person_outline,
                  onChanged: (v) {},
                  keyboardType: TextInputType.name,
                  obscureText: false,
                ),
                SizedBox(height: 16.h),

                // الإيميل
                AuthTextField(
                  hintText: lang.email,
                  icon: Icons.email_outlined,
                  onChanged: (v) {},
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                ),
                SizedBox(height: 16.h),

                // الباسورد
                AuthTextField(
                  hintText: lang.password,
                  icon: Icons.lock_outline,
                  onChanged: (v) {},
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                SizedBox(height: 16.h),

                // تأكيد الباسورد
                AuthTextField(
                  hintText: lang.confirmPassword,
                  icon: Icons.lock_outline,
                  onChanged: (v) {},
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                SizedBox(height: 24.h),

                // زر التسجيل
                CustomButton(
                  width: double.infinity,
                  height: 55.h,
                  title: lang.signUp,
                  onPressed: () {
                    showSnackbar(context, lang.accountCreated);
                    GoRouter.of(context).pop();
                  },
                ),
                SizedBox(height: 30.h),

                // عندك حساب بالفعل؟
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: lang.alreadyHaveAnAccount,
                        style: Styles.textStyle12.copyWith(
                          color: AppColors.greyprimmary,
                        ),
                      ),
                      TextSpan(
                        text: lang.signIn,
                        style: Styles.textStyle12.copyWith(
                          color: AppColors.corePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pop();
                              },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
