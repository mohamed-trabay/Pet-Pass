import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/app_router.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/app_logo.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_buttom.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
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

          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                const AppLogo(),
                SizedBox(height: 20.h),
                Text(
                  lang.welcomeBack,
                  style: Styles.textStyle24.copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  lang.signInToContinue,
                  style: Styles.textStyle14.copyWith(
                    color: AppColors.greyprimmary,
                  ),
                ),
                SizedBox(height: 40.h),

                // حقل الإيميل
                AuthTextField(
                  hintText: lang.email,
                  icon: Icons.email_outlined,
                  onChanged: (v) {},
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                ),

                SizedBox(height: 16.h),

                // حقل الباسورد
                AuthTextField(
                  hintText: lang.password,
                  icon: Icons.lock_outline,
                  onChanged: (v) {},
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),

                SizedBox(height: 12.h),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kForgetPassword);
                    },
                    child: Text(
                      lang.forgotPassword,
                      style: Styles.textStyle12.copyWith(
                        color: AppColors.greyprimmary,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                // زرار اللوجين
                CustomButton(
                  width: double.infinity,
                  height: 55.h,
                  title: lang.signIn,
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                  },
                ),

                SizedBox(height: 30.h),

                // لينك التسجيل
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: lang.dontHaveAnAccount,
                        style: Styles.textStyle12.copyWith(
                          color: AppColors.greyprimmary,
                        ),
                      ),
                      TextSpan(
                        text: lang.signUp,
                        style: Styles.textStyle12.copyWith(
                          color: AppColors.corePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                GoRouter.of(
                                  context,
                                ).push(AppRouter.ksignUpView);
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
