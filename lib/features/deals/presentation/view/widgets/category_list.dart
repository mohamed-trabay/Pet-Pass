import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/widgets/custom_loading_indicator.dart';
import 'package:pet_pass/features/deals/presentation/manger/category_cubit/category_cubit.dart';
import 'package:pet_pass/features/deals/presentation/view/widgets/all_category_card.dart';
import 'package:pet_pass/features/deals/presentation/view/widgets/category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return SizedBox(
            height: 60.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const AllCategoryCard();
                }
                return CategoryCardContainer(
                  categoryModel: state.categories[index - 1],
                );
              },
              itemCount: state.categories.length + 1,
            ),
          );
        } else if (state is CategoriesFailire) {
          return Center(
            child: Text(
              state.errMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return SizedBox(
            height: 40.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: List.generate(
                6,
                (index) => const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: CustomLoadingIndicator(aspectRatio: 2.5),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
