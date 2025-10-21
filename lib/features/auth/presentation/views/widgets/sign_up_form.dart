import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';

import 'package:pet_pass/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_buttom.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    final isLoading = context.watch<AuthCubit>().state is AuthLoading;

    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextField(
            controller: usernameController,
            hintText: 'username',
            icon: Icons.person_outline,
            onChanged: (_) {},
            keyboardType: TextInputType.text,
            obscureText: false,
            enabled: !isLoading,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return lang.pleaseEnterUsername;
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          AuthTextField(
            controller: emailController,
            hintText: lang.email,
            icon: Icons.email_outlined,
            onChanged: (_) {},
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            enabled: !isLoading,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return lang.pleaseEnterEmail;
              }
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value.trim())) {
                return lang.invalidEmail;
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          AuthTextField(
            controller: passwordController,
            hintText: lang.password,
            icon: Icons.lock_outline,
            onChanged: (_) {},
            keyboardType: TextInputType.text,
            obscureText: true,
            enabled: !isLoading,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return lang.pleaseEnterPassword;
              }
              if (value.length < 6) {
                return lang.passwordTooShort;
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          AuthTextField(
            controller: confirmPasswordController,
            hintText: lang.confirmPassword,
            icon: Icons.lock_reset_outlined,
            onChanged: (_) {},
            keyboardType: TextInputType.text,
            obscureText: true,
            enabled: !isLoading,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return lang.pleaseConfirmPassword;
              }
              if (value != passwordController.text) {
                return lang.passwordsDoNotMatch;
              }
              return null;
            },
          ),
          SizedBox(height: 24.h),
          CustomButton(
            width: double.infinity,
            height: 55.h,
            title: isLoading ? lang.loading : lang.signUp,
            onPressed:
                isLoading
                    ? null
                    : () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().register(
                          username: usernameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                      }
                    },
          ),
        ],
      ),
    );
  }
}
