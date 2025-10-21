import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:pet_pass/features/premium/presentaion/views/widgets/plans_build.dart';

class PremiumViewBody extends StatelessWidget {
  const PremiumViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.all(20.0.r),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is ProfileLoaded) {
            final user = state.profile;
            final formattedDate =
                user.registeredDate != null
                    ? DateFormat(
                      'dd MMM yyyy • hh:mm a',
                    ).format(user.registeredDate!)
                    : 'N/A';

            bool isMonthly = user.role == 'pms_subscription_plan_1902';
            bool isYearly = user.role == 'pms_subscription_plan_3080';

            if (isMonthly || isYearly) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified, color: Colors.green, size: 60.r),
                  SizedBox(height: 12.h),
                  Text(
                    'You are subscribed to the ${isMonthly ? "Monthly" : "Yearly"} plan',
                    style: Styles.textStyle18.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Subscription since: $formattedDate',
                    style: Styles.textStyle14.copyWith(
                      color: AppColors.greyprimmary,
                    ),
                  ),
                ],
              );
            } else {
              return PlansBuild(context: context, lang: lang);
            }
          } else if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return PlansBuild(context: context, lang: lang);
          }
        },
      ),
    );
  }
}
