import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isDark = false;
  Map<String, ThemeMode> themeModes = {
    'light': ThemeMode.light,
    'dark': ThemeMode.dark,
  };
  late SharedPreferences prefs;

  loadThemeMode() async {
    String themeText;

    prefs = await SharedPreferences.getInstance();
    themeText = prefs.getString('theme') ?? 'light';

    isDark = themeText == 'dark';
    setMode(themeText);
  }

  Future<void> setMode(String themeText) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeText);
  }

  changeTheme() {
    setMode(isDark ? 'light' : 'dark');
    isDark = !isDark;
    notifyListeners();
  }
}
