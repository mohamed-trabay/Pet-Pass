// lib/core/utiles/app_colors.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Color
  static const Color primary = Color(0xFFFFB81C);

  // Light Theme Colors
  static const Color lightBackground = Color(0xFFFFF8F0);
  static const Color lightText = Color(0xFF1F1F1F);

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF252B40);
  static const Color darkText = Color(0xFFFAFAFA);

  // Common Colors
  static const Color coreSecandary = Color(0xFF4CAF50);
  static const Color corePrimary = Color(0xFFC9A234);
  static const Color coreGold = Color(0xFFcca135);

  static const Color greyprimmary = Color(0xFF757575);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA500);
  static const Color error = Color(0xFFFF6B6B);
  static const Color info = Color(0xFF2196F3);

  // Secondary Colors
  static const Color secondary = Color(0xFF4CAF50);
  static const Color accent = Color(0xFFFF6B6B);

  // Light Theme Extras
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightTextSecondary = Color(0xFF757575);
  static const Color lightBorder = Color(0xFFE0E0E0);
  static const Color lightDivider = Color(0xFFEEEEEE);
  static const Color lightCardBackground = Color(0xFFFFFFFF);
  static const Color lightHint = Color(0xFFBDBDBD);

  // Dark Theme Extras
  static const Color darkSurface = Color(0xFF2F3650);
  static const Color darkTextSecondary = Color(0xFFBDBDBD);
  static const Color darkBorder = Color(0xFF3A4260);
  static const Color darkDivider = Color(0xFF313131);
  static const Color darkCardBackground = Color(0xFF2F3650);
  static const Color darkHint = Color(0xFF757575);

  // Transparent Colors
  static const Color transparent = Color(0x00000000);

  // Dynamic Colors
  static Color background(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightBackground
        : darkBackground;
  }

  static Color shadowColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white.withOpacity(0.1)
        : Colors.black.withOpacity(0.1);
  }
}
