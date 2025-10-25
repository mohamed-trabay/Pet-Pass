// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/app_router.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/app_logo.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/auth_snack_bar.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/auth_background.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/loading_overlay.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _hasNavigated = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = AppLocalizations.of(context)!;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess && !_hasNavigated) {
          _hasNavigated = true;

          Future.microtask(() {
            if (mounted) {
              context.go(AppRouter.kHomeView);
              showSnackbar(context, lang.accountCreated, isError: false);
            }
          });
        } else if (state is AuthFailure) {
          showSnackbar(context, state.message, isError: true);
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return Scaffold(
            body: Stack(
              children: [
                AuthBackground(isDark: isDark),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      const AppLogo(),
                      SizedBox(height: 15.h),
                      Text(
                        lang.createYourAccount,
                        style: Styles.textStyle24.copyWith(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        lang.signUp,
                        style: Styles.textStyle14.copyWith(
                          color: AppColors.greyprimmary,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      const SignUpForm(),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            lang.alreadyHaveAnAccount,
                            style: Styles.textStyle12.copyWith(
                              color: AppColors.greyprimmary,
                            ),
                          ),

                          TextButton(
                            onPressed:
                                isLoading
                                    ? null
                                    : () => Navigator.of(context).pop(),
                            child: Text(
                              lang.signIn,
                              style: Styles.textStyle12.copyWith(
                                color: AppColors.corePrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
                if (isLoading) const LoadingOverlay(),
              ],
            ),
          );
        },
      ),
    );
  }
}
