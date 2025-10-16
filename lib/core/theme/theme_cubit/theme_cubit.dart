import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/core/utiles/local_storage_service.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  Future<void> loadTheme() async {
    try {
      final themeMode = await LocalStorageService.loadTheme();
      emit(ThemeChanged(themeMode));
    } catch (e) {
      emit(ThemeChanged(ThemeMode.system));
    }
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    try {
      await LocalStorageService.saveTheme(themeMode);
      emit(ThemeChanged(themeMode));
    } catch (e) {
      emit(ThemeChanged(themeMode));
    }
  }

  ThemeMode getCurrentTheme() {
    if (state is ThemeChanged) {
      return (state as ThemeChanged).themeMode;
    }
    return ThemeMode.system;
  }

  Future<void> resetTheme() async {
    await changeTheme(ThemeMode.system);
  }
}
