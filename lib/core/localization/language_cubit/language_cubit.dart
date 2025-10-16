import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/core/utiles/local_storage_service.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  Future<void> loadLanguage() async {
    try {
      final languageCode = await LocalStorageService.loadLanguage();
      emit(LanguageChanged(Locale(languageCode)));
    } catch (e) {
      emit(LanguageChanged(const Locale('en')));
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    try {
      await LocalStorageService.saveLanguage(languageCode);
      emit(LanguageChanged(Locale(languageCode)));
    } catch (e) {
      debugPrint('Error changing language: $e');
    }
  }

  String getCurrentLanguageCode() {
    if (state is LanguageChanged) {
      return (state as LanguageChanged).locale.languageCode;
    }
    return 'ar';
  }
}
