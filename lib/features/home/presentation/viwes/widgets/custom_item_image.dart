import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/widgets/custom_loading_indicator.dart';

class CustomItemImage extends StatelessWidget {
  const CustomItemImage({super.key, required this.imageURL});
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    if (imageURL.isEmpty || imageURL == 'null') {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: AspectRatio(
          aspectRatio: 2.6.w / 4.h,
          child: Container(
            color: Colors.grey[300],
            child: Center(
              child: Icon(
                Icons.image_not_supported,
                size: 50.sp,
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: AspectRatio(
        aspectRatio: 2.6.w / 4.h,
        child: CachedNetworkImage(
          imageUrl: imageURL,
          fit: BoxFit.fill,
          placeholder: (context, url) => const CustomLoadingIndicator(),
          errorWidget:
              (context, url, error) => Container(
                color: Colors.grey[300],
                child: Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 50.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
