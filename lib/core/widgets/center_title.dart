import 'package:flutter/material.dart';
import 'package:pet_pass/core/utiles/styles.dart';

class CenteredTitle extends StatelessWidget {
  const CenteredTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: Styles.textStyle24,
        textAlign: TextAlign.center,
      ),
    );
  }
}
