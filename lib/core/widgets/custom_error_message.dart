import 'package:flutter/material.dart';
import 'package:pet_pass/core/utiles/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errMessage;

  const CustomErrorWidget({super.key, required this.errMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: Styles.textStyle18.copyWith(color: Colors.red),
        textAlign: TextAlign.center,
      ),
    );
  }
}
