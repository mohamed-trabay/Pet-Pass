import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:pet_pass/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_buttom.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final isLoading = context.watch<AuthCubit>().state is AuthLoading;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          AuthTextField(
            controller: _usernameController,
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
            controller: _emailController,
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
            controller: _passwordController,
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
            controller: _confirmPasswordController,
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
              if (value != _passwordController.text) {
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
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().register(
                          username: _usernameController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );
                      }
                    },
          ),
        ],
      ),
    );
  }
}
