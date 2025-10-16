import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/styles.dart';
import 'package:pet_pass/core/widgets/custom_app_bar.dart';
import 'package:pet_pass/core/widgets/custom_text_field.dart';
import 'package:pet_pass/features/search/presentation/views/widgetas/search_result_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.all(20.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: lang.search),
          SizedBox(height: 20.h),

          const CustomTextField(),
          SizedBox(height: 16.h),
          Text(lang.result, style: Styles.textStyle18),
          SizedBox(height: 16.h),
          const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
