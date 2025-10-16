import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/item_details/item_details_image.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/item_details_section.dart';

class ItemDetailsViewBody extends StatelessWidget {
  const ItemDetailsViewBody({super.key, required this.productmodel});
  final OfferModel productmodel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(20.0.r),
            child: Column(
              children: [
                ItemDetailsImage(product: productmodel),

                ItemDetailsSection(products: productmodel),

                SizedBox(height: 26.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
