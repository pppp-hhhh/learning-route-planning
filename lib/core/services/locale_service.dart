import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier(ref);
});

class LocaleNotifier extends StateNotifier<Locale> {
  static const _localePref = 'app_locale';
  final Ref ref;

  LocaleNotifier(this.ref) : super(const Locale('zh')) {
    _init();
  }

  Future<void> _init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final localeCode = prefs.getString(_localePref) ?? 'zh';
      if (mounted) {
        state = Locale(localeCode);
      }
    } catch (e) {
      // Fallback to Chinese on error
    }
  }

  Future<void> setLocale(Locale locale) async {
    state = locale;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localePref, locale.languageCode);
    } catch (e) {
      // Ignore save errors
    }
  }

  void toggleLocale() {
    if (state.languageCode == 'zh') {
      setLocale(const Locale('en'));
    } else {
      setLocale(const Locale('zh'));
    }
  }
}
