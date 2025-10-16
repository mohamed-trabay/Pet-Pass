// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pass/core/localization/app_localizations.dart';
import 'package:pet_pass/core/theme/theme_cubit/theme_cubit.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        ThemeMode currentTheme = ThemeMode.system;

        if (state is ThemeChanged) {
          currentTheme = state.themeMode;
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
                    Icons.palette,
                    color: Theme.of(context).primaryColor,
                    size: 24.sp,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    lang.changeTheme,
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
                    child: _buildThemeOption(
                      context: context,
                      theme: ThemeMode.light,
                      label: lang.lightMode,
                      icon: Icons.light_mode,
                      isSelected: currentTheme == ThemeMode.light,
                      isDarkMode: isDarkMode,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildThemeOption(
                      context: context,
                      theme: ThemeMode.dark,
                      label: lang.darkMode,
                      icon: Icons.dark_mode,
                      isSelected: currentTheme == ThemeMode.dark,
                      isDarkMode: isDarkMode,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildThemeOption(
                      context: context,
                      theme: ThemeMode.system,
                      label: lang.systemMode,
                      icon: Icons.brightness_auto,
                      isSelected: currentTheme == ThemeMode.system,
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

  Widget _buildThemeOption({
    required BuildContext context,
    required ThemeMode theme,
    required String label,
    required IconData icon,
    required bool isSelected,
    required bool isDarkMode,
  }) {
    return InkWell(
      onTap: () {
        context.read<ThemeCubit>().changeTheme(theme);
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
            Icon(
              icon,
              size: 32.sp,
              color:
                  isSelected
                      ? Theme.of(context).primaryColor
                      : (isDarkMode
                          ? Colors.grey[400]
                          : Theme.of(
                            context,
                          ).iconTheme.color?.withOpacity(0.6)),
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
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
