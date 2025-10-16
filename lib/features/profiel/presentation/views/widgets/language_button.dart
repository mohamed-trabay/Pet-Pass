// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/localization/language_cubit/language_cubit.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        String currentLanguage = 'ar';
        if (state is LanguageChanged) {
          currentLanguage = state.locale.languageCode;
        }

        return Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[850] : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color:
                    isDarkMode
                        ? Colors.black.withOpacity(0.3)
                        : Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.language,
                    color: Theme.of(context).primaryColor,
                    size: 24.sp,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    lang.language,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: _buildLanguageOption(
                      context: context,
                      language: 'ar',
                      label: 'العربية',
                      flag: '🇪🇬',
                      isSelected: currentLanguage == 'ar',
                      isDarkMode: isDarkMode,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildLanguageOption(
                      context: context,
                      language: 'en',
                      label: 'English',
                      flag: '🇺🇸',
                      isSelected: currentLanguage == 'en',
                      isDarkMode: isDarkMode,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption({
    required BuildContext context,
    required String language,
    required String label,
    required String flag,
    required bool isSelected,
    required bool isDarkMode,
  }) {
    return InkWell(
      onTap: () {
        context.read<LanguageCubit>().changeLanguage(language);
      },
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Theme.of(
                    context,
                  ).primaryColor.withOpacity(isDarkMode ? 0.25 : 0.1)
                  : (isDarkMode
                      ? Colors.grey[800]
                      : Colors.grey.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color:
                isSelected
                    ? Theme.of(context).primaryColor
                    : (isDarkMode ? Colors.grey[700]! : Colors.transparent),
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Text(flag, style: TextStyle(fontSize: 32.sp)),
            SizedBox(height: 8.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color:
                    isSelected
                        ? Theme.of(context).primaryColor
                        : (isDarkMode ? Colors.grey[300] : Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
