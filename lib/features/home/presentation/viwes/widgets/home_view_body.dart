import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/features/home/presentation/manger/newest_product_cubit/cubit/newest_product_cubit.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/banner_slider.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_banner_column.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/fixed_bannar.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/home_appbar.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_item_list.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_row.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    await Future.wait([
      context.read<NewestProductCubit>().fetchNewestProduct(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return RefreshIndicator(
      onRefresh: () => _onRefresh(context),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const HomeAppBar(),
                const BannerSlider(),
                const FixedBanner(),

                SizedBox(height: 22.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    children: [
                      CustomRow(title: lang.newestItems),
                      SizedBox(height: 12.h),
                      const CustomItemList(limit: 6),
                    ],
                  ),
                ),

                SizedBox(height: 25.h),
                const CustomBannerColumn(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
