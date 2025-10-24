import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../manger/forgot_password_cubit/forgot_password_cubit.dart';
import '../../../../../core/utiles/styles.dart';
import 'auth_text_field.dart';
import '../../../../../features/home/presentation/viwes/widgets/custom_buttom.dart';

class ForgotPasswordCodeStep extends StatelessWidget {
  final bool isLoading;
  ForgotPasswordCodeStep({super.key, required this.isLoading});

  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Enter Validation Code", style: Styles.textStyle24),
          SizedBox(height: 20.h),
          AuthTextField(
            controller: _codeController,
            hintText: "code",
            icon: Icons.security,
            obscureText: false,
            enabled: !isLoading,
            validator: (value) => value!.isEmpty ? "Enter Code" : null,
            onChanged: (String p1) {},
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 30.h),
          CustomButton(
            title: "Verify Code",
            onPressed:
                isLoading
                    ? null
                    : () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ForgotPasswordCubit>().verifyCode(
                          _codeController.text,
                        );
                      }
                    },
          ),
        ],
      ),
    );
  }
}
