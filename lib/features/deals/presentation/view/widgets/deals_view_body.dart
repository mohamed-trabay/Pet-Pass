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
    context.read<DealsCubit>().fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _onRefresh(context),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: DealsAppBar()),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(18.0.r),
              child: Column(
                children: [
                  const CategoryList(),
                  SizedBox(height: 20.h),
                  const DealsList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
