import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/widgets/custom_error_message.dart';
import 'package:pet_pass/core/widgets/custom_loading_indicator.dart';
import 'package:pet_pass/features/home/presentation/manger/newest_product_cubit/cubit/newest_product_cubit.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_item.dart';

class CustomItemList extends StatelessWidget {
  final int? limit;

  const CustomItemList({super.key, this.limit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestProductCubit, NewestProductState>(
      builder: (context, state) {
        if (state is NewestProductSuccess) {
          final products = state.products;
          final itemCount =
              limit != null && limit! < products.length
                  ? limit!
                  : products.length;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return CustomItem(productModel: products[index]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 17.w,
              childAspectRatio: 2.8.w / 4.h,
            ),
          );
        } else if (state is NewestProductFailire) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return const CustomLoadingIndicator();
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 17,
              childAspectRatio: 2.8 / 4,
            ),
          );
        }
      },
    );
  }
}
