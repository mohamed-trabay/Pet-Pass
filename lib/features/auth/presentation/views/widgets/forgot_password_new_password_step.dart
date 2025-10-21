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
          Text("أدخل كلمة مرور جديدة", style: Styles.textStyle24),
          SizedBox(height: 20.h),
          AuthTextField(
            controller: _passwordController,
            hintText: "كلمة المرور الجديدة",
            icon: Icons.lock_outline,
            obscureText: true,
            validator: (v) => v!.length < 6 ? "كلمة المرور قصيرة جداً" : null,
            onChanged: (String p1) {},
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 16.h),
          AuthTextField(
            controller: _confirmController,
            hintText: "تأكيد كلمة المرور",
            icon: Icons.lock_outline,
            obscureText: true,
            validator:
                (v) =>
                    v != _passwordController.text
                        ? "كلمتا المرور غير متطابقتين"
                        : null,
            onChanged: (String p1) {},
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 30.h),
          CustomButton(
            title: "تغيير كلمة المرور",
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
