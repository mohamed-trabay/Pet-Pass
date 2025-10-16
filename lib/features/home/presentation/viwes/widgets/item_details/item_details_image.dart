import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/widgets/fav_icon.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_item_image.dart';

class ItemDetailsImage extends StatelessWidget {
  const ItemDetailsImage({super.key, required this.product});
  final OfferModel product;

  List<String> _getValidImages() {
    try {
      return product.images
          .where((img) => img.src.isNotEmpty)
          .map((img) => img.src)
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final validImages = _getValidImages();

    if (validImages.isEmpty) {
      return SizedBox(
        height: 400.h,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              color: Colors.grey[300],
              child: Center(
                child: Icon(
                  Icons.image_not_supported,
                  size: 80.sp,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 10,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 28),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Positioned(right: 0, top: 10, child: FavIcon(product: product)),
          ],
        ),
      );
    }

    return Stack(
      children: [
        SizedBox(
          height: 400.h,
          width: double.infinity,
          child: CarouselSlider(
            items:
                validImages
                    .map((imageURL) => CustomItemImage(imageURL: imageURL))
                    .toList(),
            options: CarouselOptions(
              height: 400.h,
              viewportFraction: 1,
              initialPage: 0,
              enlargeCenterPage: true,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 10,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 28),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        Positioned(right: 0, top: 10, child: FavIcon(product: product)),
      ],
    );
  }
}
