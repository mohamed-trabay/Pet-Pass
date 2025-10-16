import 'package:flutter/material.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/styles.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.textStyle18.copyWith(color: AppColors.corePrimary),
        ),
        // GestureDetector(
        //   onTap: onTap,
        //   child: Text(
        //     lang.more,
        //     style: Styles.textStyle16.copyWith(color: AppColors.greyprimmary),
        //   ),
        // ),
      ],
    );
  }
}
