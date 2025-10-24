import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/utiles/app_colors.dart';
import 'package:pet_pass/features/deals/presentation/manger/deals_cubit/deals_cubit.dart';
import 'package:pet_pass/features/home/data/models/category_model.dart';

class CategoryCardContainer extends StatelessWidget {
  const CategoryCardContainer({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsCubit, DealsState>(
      builder: (context, state) {
        final dealsCubit = context.read<DealsCubit>();
        final isSelected = dealsCubit.isSelected(categoryModel.id);

        return GestureDetector(
          onTap: () {
            dealsCubit.fetchProductsByCategory(categoryModel.id);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 6.w),
            alignment: Alignment.center,
            height: 40.h,
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? AppColors.coreGold
                      : AppColors.background(context),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor(context),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Html(
              key: ValueKey('category_${categoryModel.id}'),
              data: categoryModel.name,
              style: {
                'body': Style(
                  fontSize: FontSize(16),
                  fontWeight: FontWeight.w400,
                  margin: Margins.zero,
                  color: isSelected ? Colors.white : null,
                ),
              },
            ),
          ),
        );
      },
    );
  }
}
