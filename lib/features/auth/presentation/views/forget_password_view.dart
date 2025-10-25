// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/features/auth/presentation/manger/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:pet_pass/features/auth/presentation/manger/forgot_password_cubit/forgot_password_state.dart';

import 'widgets/forgot_password_email_step.dart';
import 'widgets/forgot_password_code_step.dart';
import 'widgets/forgot_password_new_password_step.dart';
import 'widgets/step_indicator.dart';
import 'widgets/app_logo.dart';
import 'widgets/auth_snack_bar.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ResetCodeSent) {
          showSnackbar(context, "please check your email for the reset code");
        } else if (state is CodeVerified) {
          showSnackbar(
            context,
            "verification successful, please set a new password",
          );
        } else if (state is PasswordResetSuccess) {
          showSnackbar(context, "password reset successful");
          Navigator.pop(context);
        } else if (state is ForgotPasswordError) {
          showSnackbar(context, state.message, isError: true);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ForgotPasswordCubit>();
        final isLoading = state is ForgotPasswordLoading;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed:
                  isLoading
                      ? null
                      : () {
                        if (cubit.currentStep == 0) {
                          Navigator.pop(context);
                        } else {
                          cubit.goPreviousStep();
                        }
                      },
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    const AppLogo(),
                    SizedBox(height: 30.h),
                    StepIndicator(currentStep: cubit.currentStep),
                    SizedBox(height: 40.h),
                    if (cubit.currentStep == 0)
                      ForgotPasswordEmailStep(isLoading: isLoading),
                    if (cubit.currentStep == 1)
                      ForgotPasswordCodeStep(isLoading: isLoading),
                    if (cubit.currentStep == 2)
                      ForgotPasswordNewPasswordStep(isLoading: isLoading),
                  ],
                ),
              ),
              if (isLoading)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        );
      },
    );
  }
}
