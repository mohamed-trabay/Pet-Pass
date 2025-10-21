import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/core/utiles/app_router.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/core/widgets/fav_icon.dart';
import 'package:pet_pass/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_item_image.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/item_details/subscription_dialog.dart';
import 'package:pet_pass/features/profiel/data/models/user_info_model.dart';

class FavContainer extends StatelessWidget {
  const FavContainer({super.key, required this.product});
  final OfferModel product;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        String role = 'subscriber';

        if (state is ProfileLoaded) {
          final UserModel profile = state.profile;
          role = profile.role ?? 'subscriber';
        }

        bool hasSubscription =
            role == 'pms_subscription_plan_1902' ||
            role == 'pms_subscription_plan_3080';
        return GestureDetector(
          onTap: () {
            if (hasSubscription) {
              GoRouter.of(
                context,
              ).push(AppRouter.kItemDetailsView, extra: product);
            } else {
              SubscriptionDialog(context, lang);
            }
          },

          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Stack(
              children: [
                Container(
                  height: 140.h,
                  width: double.infinity,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: AppColors.background(context),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor(context),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 120.h,
                        child: CustomItemImage(
                          imageURL:
                              product.images.isNotEmpty
                                  ? product.images[0].src
                                  : 'https://testapp.zbooma.com/wp-content/uploads/2025/09/Screenshot_%D9%A2%D9%A0%D9%A2%D9%A5%D9%A0%D9%A9%D9%A1%D9%A5_%D9%A1%D9%A8%D9%A5%D9%A9%D9%A2%D9%A9_Google.jpg',
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.name,
                              style: Styles.textStyle14Bold,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.h),

                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(lang.free, style: Styles.textStyle14Bold),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  right: -8,
                  top: -2,
                  child: FavIcon(product: product),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
