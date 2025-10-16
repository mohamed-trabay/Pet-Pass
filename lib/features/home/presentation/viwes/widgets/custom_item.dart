import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/app_router.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';
import 'package:pet_pass/core/widgets/fav_icon.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_item_image.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.productModel});
  final OfferModel productModel;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.kItemDetailsView, extra: productModel);
      },
      child: Stack(
        children: [
          Container(
            height: 250.h,
            width: 160.w,
            decoration: BoxDecoration(
              color: AppColors.background(context),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor(context),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(10.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: SizedBox(
                    height: 120.h,
                    width: double.infinity,
                    child: CustomItemImage(
                      imageURL:
                          productModel.images.isNotEmpty
                              ? productModel.images[0].src
                              : 'https://i.postimg.cc/QdMnTztt/woocommerce-placeholder.webp',
                    ),
                  ),
                ),
                SizedBox(height: 8.h),

                Text(
                  productModel.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14Bold,
                ),
                SizedBox(height: 6.h),

                Text(
                  lang.free,
                  style: Styles.textStyle14.copyWith(
                    color: AppColors.greyprimmary,
                  ),
                ),
              ],
            ),
          ),

          // أيقونة المفضلة
          Positioned(top: 8, right: 6, child: FavIcon(product: productModel)),
        ],
      ),
    );
  }
}
