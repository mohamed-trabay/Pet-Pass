// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.keyboardType,
    required this.obscureText,
    this.controller,
    this.enabled,
    this.validator,
  });

  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? enabled;
  final String? Function(String?)? validator; // ✅ validator مخصص

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextFormField(
      enabled: enabled ?? true,
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      autocorrect: !obscureText,
      enableSuggestions: !obscureText,
      validator: validator, // ✅ استخدام الـ validator المخصص
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.5)),
        prefixIcon: Icon(icon, color: colorScheme.onSurface.withOpacity(0.7)),
        filled: true,
        fillColor: colorScheme.surface.withOpacity(0.1),

        // ✅ Border عادي
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colorScheme.onSurface.withOpacity(0.3),
            width: 1,
          ),
        ),

        // ✅ Border عند Focus
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),

        // ✅ Border عند الخطأ
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),

        // ✅ Border عند الخطأ مع Focus
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),

        // ✅ Border عند التعطيل
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colorScheme.onSurface.withOpacity(0.1),
            width: 1,
          ),
        ),

        // ✅ تخصيص شكل رسالة الخطأ
        errorStyle: const TextStyle(fontSize: 12, height: 0.8),
      ),
      style: TextStyle(color: colorScheme.onSurface),
      keyboardType: keyboardType,
    );
  }
}
