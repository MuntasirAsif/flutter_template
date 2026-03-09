import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(const Locale('en'));

  void changeLanguage(Locale locale) {
    state = locale;
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>((ref) {
  return LanguageNotifier();
});
