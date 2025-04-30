import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = 'en';

  bool get isDark => currentTheme == ThemeMode.dark;

  bool get isEnglish => currentLanguage == "en";

  void changeAppTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  void changeAppLanguage(String newlang) {
    if (currentLanguage == newlang) return;
    currentLanguage = newlang;
    notifyListeners();
  }
}
