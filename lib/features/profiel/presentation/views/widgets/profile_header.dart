import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/auth_snack_bar.dart';
import 'package:pet_pass/features/profiel/data/models/user_info_model.dart';
import 'package:pet_pass/features/profiel/presentation/manger/profiel_image_cubit/profiel_image_cubit.dart';
import 'package:pet_pass/features/profiel/presentation/views/widgets/profile_avatar_widget.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfielImageCubit, ProfielImageState>(
      listener: (context, state) {
        if (state is ProfileImageFailure) {
          showSnackbar(context, state.errMessage, isError: true);
        } else if (state is ProfileImageSuccess) {
          showSnackbar(
            context,
            'Profile image updated successfully!',
            isError: false,
          );
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          String userName = 'username';
          String userEmail = 'user@gmail.com';
          String role = 'subscriber';

          if (state is ProfileLoaded) {
            final UserModel profile = state.profile;
            userName = profile.username;
            userEmail = profile.email;
            role = profile.role ?? 'subscriber';
          }

          String planText = 'Plan: Inactive';
          Color planColor = Colors.red;
          Color planBackground = Colors.red[100]!;

          if (role == 'pms_subscription_plan_1902') {
            planText = 'Plan: Monthly';
            planColor = Colors.green;
            planBackground = Colors.green[100]!;
          } else if (role == 'pms_subscription_plan_3080') {
            planText = 'Plan: Yearly';
            planColor = Colors.blue;
            planBackground = Colors.blue[100]!;
          } else if (role.toLowerCase() == 'subscriber') {
            planText = 'Plan: Inactive';
            planColor = Colors.red;
            planBackground = Colors.red[100]!;
          }

          return Container(
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                const ProfileAvatarWidget(size: 60, showEditButton: true),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userName, style: Styles.textStyle18),
                      SizedBox(height: 4.h),
                      Text(
                        userEmail,
                        style: Styles.textStyle14.copyWith(
                          color: AppColors.greyprimmary,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: planBackground,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          planText,
                          style: Styles.textStyle14.copyWith(
                            color: planColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
