import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/features/deals/presentation/manger/deals_cubit/deals_cubit.dart';
import 'package:pet_pass/features/deals/presentation/view/widgets/category_list.dart';
import 'package:pet_pass/features/deals/presentation/view/widgets/deals_appbar.dart';
import 'package:pet_pass/features/deals/presentation/view/widgets/deals_list.dart';

class DealsViewBody extends StatelessWidget {
  const DealsViewBody({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    await context.read<DealsCubit>().fetchAllProducts();
  }

  bool _onScrollNotification(
    ScrollNotification notification,
    BuildContext context,
  ) {
    if (notification is ScrollUpdateNotification) {
      final metrics = notification.metrics;

      if (metrics.pixels >= metrics.maxScrollExtent * 0.8) {
        final cubit = context.read<DealsCubit>();
        final state = cubit.state;

        // Prevent multiple calls
        if (state is FilteredProductsLoadingMore) return false;

        if (state is FilteredProductsSuccess && state.hasMore) {
          if (cubit.selectedCategoryId == null) {
            cubit.fetchAllProducts(loadMore: true);
          } else {
            cubit.fetchProductsByCategory(
              cubit.selectedCategoryId!,
              loadMore: true,
            );
          }
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _onRefresh(context),
      child: NotificationListener<ScrollNotification>(
        onNotification:
            (notification) => _onScrollNotification(notification, context),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: DealsAppBar()),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                child: Column(
                  children: [
                    SizedBox(height: 18.h),
                    const CategoryList(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 18.0.w),
              sliver: const DealsList(),
            ),
          ],
        ),
      ),
    );
  }
}
