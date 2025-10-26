// lib/core/services/local_storage_service.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pet_pass/features/home/data/models/product_model/offer_model.dart';

class LocalStorageService {
  static const String _favKey = 'fav_items';
  static const String _userInfoKey = 'user_info';
  static const String _themeKey = 'theme_mode';
  static const String _languageKey = 'language';

  // ===================== FAVORITES =====================

  static Future<void> saveFavorites(List<OfferModel> products) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encoded = jsonEncode(products.map((p) => p.toJson()).toList());
      await prefs.setString(_favKey, encoded);
    } catch (e) {
      debugPrint('Error saving favorites: $e');
    }
  }

  static Future<List<OfferModel>> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(_favKey);
      if (data == null) return [];
      final decoded = jsonDecode(data) as List;
      return decoded.map((e) => OfferModel.fromJson(e)).toList();
    } catch (e) {
      debugPrint('Error loading favorites: $e');
      return [];
    }
  }

  static Future<void> clearFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_favKey);
    } catch (e) {
      debugPrint('Error clearing favorites: $e');
    }
  }

  static Future<void> addToFavorites(OfferModel product) async {
    try {
      final favs = await loadFavorites();
      if (!favs.any((p) => p.id == product.id)) {
        favs.add(product);
        await saveFavorites(favs);
      }
    } catch (e) {
      debugPrint('Error adding to favorites: $e');
    }
  }

  static Future<void> removeFromFavorites(OfferModel product) async {
    try {
      final favs = await loadFavorites();
      favs.removeWhere((p) => p.id == product.id);
      await saveFavorites(favs);
    } catch (e) {
      debugPrint('Error removing from favorites: $e');
    }
  }

  static Future<bool> isFavorite(OfferModel product) async {
    try {
      final favs = await loadFavorites();
      return favs.any((p) => p.id == product.id);
    } catch (e) {
      debugPrint('Error checking favorite: $e');
      return false;
    }
  }

  static Future<void> toggleFavorite(OfferModel product) async {
    try {
      final isFav = await isFavorite(product);
      if (isFav) {
        await removeFromFavorites(product);
      } else {
        await addToFavorites(product);
      }
    } catch (e) {
      debugPrint('Error toggling favorite: $e');
    }
  }

  // ===================== USER INFO =====================

  static Future<void> saveUserInfo(Map<String, String> userInfo) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encoded = jsonEncode(userInfo);
      await prefs.setString(_userInfoKey, encoded);
    } catch (e) {
      debugPrint('Error saving user info: $e');
    }
  }

  static Future<Map<String, String>> loadUserInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(_userInfoKey);
      if (data == null) return {};
      final decoded = jsonDecode(data);
      return Map<String, String>.from(decoded);
    } catch (e) {
      debugPrint('Error loading user info: $e');
      return {};
    }
  }

  static Future<void> clearUserInfo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_userInfoKey);
    } catch (e) {
      debugPrint('Error clearing user info: $e');
    }
  }

  static Future<void> updateUserInfo(String key, String value) async {
    try {
      final userInfo = await loadUserInfo();
      userInfo[key] = value;
      await saveUserInfo(userInfo);
    } catch (e) {
      debugPrint('Error updating user info: $e');
    }
  }

  // ===================== AVATAR =====================

  static Future<void> saveAvatarUrl(String userId, String avatarUrl) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('avatar_url_$userId', avatarUrl);
    } catch (e) {
      debugPrint('Error saving avatar URL: $e');
    }
  }

  static Future<String?> getAvatarUrl(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('avatar_url_$userId');
    } catch (e) {
      debugPrint('Error getting avatar URL: $e');
      return null;
    }
  }

  static Future<void> clearAvatarUrl(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('avatar_url_$userId');
      await prefs.remove('avatar_public_id_$userId');
    } catch (e) {
      debugPrint('Error clearing avatar URL: $e');
    }
  }

  // ===================== THEME =====================

  static Future<void> saveTheme(ThemeMode themeMode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_themeKey, themeMode.index);
    } catch (e) {
      debugPrint('Error saving theme: $e');
    }
  }

  static Future<ThemeMode> loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeIndex = prefs.getInt(_themeKey);
      if (themeIndex == null) return ThemeMode.system;
      return ThemeMode.values[themeIndex];
    } catch (e) {
      debugPrint('Error loading theme: $e');
      return ThemeMode.system;
    }
  }

  static Future<void> clearTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_themeKey);
    } catch (e) {
      debugPrint('Error clearing theme: $e');
    }
  }

  // ===================== LANGUAGE =====================

  static Future<void> saveLanguage(String languageCode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_languageKey, languageCode);
    } catch (e) {
      debugPrint('Error saving language: $e');
    }
  }

  static Future<String> loadLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_languageKey) ?? 'en';
    } catch (e) {
      debugPrint('Error loading language: $e');
      return 'ar';
    }
  }

  static Future<void> clearLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_languageKey);
    } catch (e) {
      debugPrint('Error clearing language: $e');
    }
  }

  // ===================== GENERAL =====================

  static Future<void> clearAll() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      debugPrint('Error clearing all data: $e');
    }
  }

  static Future<void> clearAllExceptUserData() async {
    try {
      final userInfo = await loadUserInfo();
      final theme = await loadTheme();
      final language = await loadLanguage();

      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      // Restore important data
      await saveUserInfo(userInfo);
      await saveTheme(theme);
      await saveLanguage(language);
    } catch (e) {
      debugPrint('Error clearing data: $e');
    }
  }

  // ===================== HELPERS =====================

  static Future<bool> hasKey(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.containsKey(key);
    } catch (e) {
      debugPrint('Error checking key: $e');
      return false;
    }
  }

  static Future<void> removeKey(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } catch (e) {
      debugPrint('Error removing key: $e');
    }
  }
}
