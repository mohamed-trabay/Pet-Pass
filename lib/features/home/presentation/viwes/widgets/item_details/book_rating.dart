import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/utiles/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, size: 24),
        SizedBox(width: 4.w),
        Text('($rating)', style: Styles.textStyle16),
      ],
    );
  }
}
