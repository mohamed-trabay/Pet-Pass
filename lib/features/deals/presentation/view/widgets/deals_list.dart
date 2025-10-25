import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/widgets/custom_error_message.dart';
import 'package:pet_pass/core/widgets/custom_loading_indicator.dart';
import 'package:pet_pass/features/deals/presentation/manger/deals_cubit/deals_cubit.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_item.dart';

class DealsList extends StatelessWidget {
  const DealsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsCubit, DealsState>(
      builder: (context, state) {
        if (state is FilteredProductsLoading) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const CustomLoadingIndicator(),
              childCount: 6,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 17.w,
              childAspectRatio: 2.8.w / 4.h,
            ),
          );
        }

        if (state is FilteredProductsSuccess ||
            state is FilteredProductsLoadingMore) {
          final products =
              state is FilteredProductsSuccess
                  ? state.products
                  : (state as FilteredProductsLoadingMore).currentProducts;

          final hasMore =
              state is FilteredProductsSuccess ? state.hasMore : true;

          if (products.isEmpty) {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Text(
                    'No products found',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
            );
          }

          return SliverMainAxisGroup(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return CustomItem(productModel: products[index]);
                }, childCount: products.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 17.w,
                  childAspectRatio: 2.8.w / 4.h,
                ),
              ),

              // Loading indicator أثناء تحميل المزيد
              if (state is FilteredProductsLoadingMore)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                    child: Center(
                      child: SizedBox(
                        height: 40.h,
                        width: double.infinity,
                        child: const CustomLoadingIndicator(),
                      ),
                    ),
                  ),
                ),

              // رسالة "No more products"
              if (state is FilteredProductsSuccess &&
                  !hasMore &&
                  products.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Center(
                      child: Text(
                        'No more products',
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }

        if (state is FilteredProductsFailure) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: CustomErrorWidget(errMessage: state.errMessage),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
