import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/widgets/center_title.dart';
import 'package:pet_pass/core/widgets/custom_text_field.dart';
import 'package:pet_pass/features/fav/presentation/views/widgets/fav_list.dart';

class FavViewBody extends StatelessWidget {
  const FavViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.all(20.0.r),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CenteredTitle(title: lang.fav),
            SizedBox(height: 19.h),
            const CustomTextField(),

            SizedBox(height: 16.h),
            const FavList(),
          ],
        ),
      ),
    );
  }
}
