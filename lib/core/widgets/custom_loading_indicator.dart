import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final BorderRadius? borderRadius;
  final double? aspectRatio;
  final bool isCircle;

  const CustomLoadingIndicator({
    super.key,
    this.borderRadius,
    this.aspectRatio,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio ?? 1,
      child: Shimmer(
        colorOpacity: 0.5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            borderRadius:
                isCircle ? null : borderRadius ?? BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
