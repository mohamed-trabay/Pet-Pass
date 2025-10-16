import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/utiles/app_router.dart';
import 'package:pet_pass/core/widgets/center_title.dart';
import 'package:pet_pass/core/widgets/custom_icon_button.dart';

class DealsAppBar extends StatelessWidget {
  const DealsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final lang = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 28.w),
          CenteredTitle(title: lang.allProduct),
          CustomIconButton(
            icon: Icons.search,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSerchView);
            },
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}
