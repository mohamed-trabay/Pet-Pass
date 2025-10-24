import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../manger/forgot_password_cubit/forgot_password_cubit.dart';
import '../../../../../core/utiles/styles.dart';
import 'auth_text_field.dart';
import '../../../../../features/home/presentation/viwes/widgets/custom_buttom.dart';

class ForgotPasswordNewPasswordStep extends StatelessWidget {
  final bool isLoading;
  ForgotPasswordNewPasswordStep({super.key, required this.isLoading});

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Enter new password", style: Styles.textStyle24),
          SizedBox(height: 20.h),
          AuthTextField(
            controller: _passwordController,
            hintText: "New Password",
            icon: Icons.lock_outline,
            obscureText: true,
            validator: (v) => v!.length < 6 ? "password too short" : null,
            onChanged: (String p1) {},
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 16.h),
          AuthTextField(
            controller: _confirmController,
            hintText: "Confirm Password",
            icon: Icons.lock_outline,
            obscureText: true,
            validator:
                (v) =>
                    v != _passwordController.text
                        ? "Passwords do not match"
                        : null,
            onChanged: (String p1) {},
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 30.h),
          CustomButton(
            title: "Set New Password",
            onPressed:
                isLoading
                    ? null
                    : () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ForgotPasswordCubit>().setNewPassword(
                          _passwordController.text,
                        );
                      }
                    },
          ),
        ],
      ),
    );
  }
}
