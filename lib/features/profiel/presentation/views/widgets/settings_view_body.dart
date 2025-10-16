import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/widgets/custom_app_bar.dart';
import 'package:pet_pass/features/profiel/presentation/views/widgets/language_button.dart';
import 'package:pet_pass/features/profiel/presentation/views/widgets/theme_button.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.all(20.0.r),
      child: Column(
        children: [
          CustomAppBar(title: lang.settings),
          SizedBox(height: 20.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const LanguageButton(),
                  SizedBox(height: 20.h),
                  const ThemeButton(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
