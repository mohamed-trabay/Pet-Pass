import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../manger/forgot_password_cubit/forgot_password_cubit.dart';
import '../../../../../core/utiles/styles.dart';
import 'auth_text_field.dart';
import '../../../../../features/home/presentation/viwes/widgets/custom_buttom.dart';

class ForgotPasswordEmailStep extends StatelessWidget {
  final bool isLoading;
  ForgotPasswordEmailStep({super.key, required this.isLoading});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("نسيت كلمة المرور", style: Styles.textStyle24),
          SizedBox(height: 20.h),
          AuthTextField(
            controller: _emailController,
            hintText: "البريد الإلكتروني",
            icon: Icons.email_outlined,
            obscureText: false,
            enabled: !isLoading,
            validator:
                (value) => value!.isEmpty ? "أدخل البريد الإلكتروني" : null,
            onChanged: (String p1) {},
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 30.h),
          CustomButton(
            title: "إرسال الكود",
            onPressed:
                isLoading
                    ? null
                    : () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ForgotPasswordCubit>().sendResetCode(
                          _emailController.text,
                        );
                      }
                    },
          ),
        ],
      ),
    );
  }
}
