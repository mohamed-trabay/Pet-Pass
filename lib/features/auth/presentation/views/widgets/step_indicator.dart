import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utiles/app_colors.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _circle(1, currentStep >= 0),
        _line(currentStep >= 1),
        _circle(2, currentStep >= 1),
        _line(currentStep >= 2),
        _circle(3, currentStep >= 2),
      ],
    );
  }

  Widget _circle(int step, bool active) => Container(
    width: 35.w,
    height: 35.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: active ? AppColors.corePrimary : Colors.grey[300],
    ),
    child: Center(
      child: Text(
        '$step',
        style: TextStyle(
          color: active ? Colors.white : Colors.grey[600],
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
      ),
    ),
  );

  Widget _line(bool active) => Container(
    width: 40.w,
    height: 2.h,
    color: active ? AppColors.corePrimary : Colors.grey[300],
  );
}
