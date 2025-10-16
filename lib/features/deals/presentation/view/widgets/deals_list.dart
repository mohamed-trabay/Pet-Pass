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
        if (state is FilteredProductsSuccess) {
          if (state.products.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Text(
                  'No products found',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            );
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return CustomItem(productModel: state.products[index]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 17.w,
              childAspectRatio: 2.8.w / 4.h,
            ),
          );
        } else if (state is FilteredProductsFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is FilteredProductsLoading) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return const CustomLoadingIndicator();
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 17.w,
              childAspectRatio: 2.8.w / 4.h,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
