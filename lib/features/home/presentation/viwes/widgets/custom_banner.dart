// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.asset(
        imagePath,
        width: double.infinity,

        height: 180.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
