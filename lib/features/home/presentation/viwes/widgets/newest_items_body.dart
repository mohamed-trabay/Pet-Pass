import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/widgets/custom_app_bar.dart';
import 'package:pet_pass/features/home/presentation/viwes/widgets/custom_item_list.dart';

class NewestItemsBody extends StatelessWidget {
  const NewestItemsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(20.0.r),
            child: Column(
              children: [
                CustomAppBar(title: lang.newestItems),
                SizedBox(height: 12.h),
                const CustomItemList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
