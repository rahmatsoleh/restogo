import "package:flutter/material.dart";
import "package:restogo_app/static/theme_prefences.dart";
import "package:shared_preferences/shared_preferences.dart";

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  void changeTheme() async {
    isDarkMode = !isDarkMode;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(ThemePrefences.key.name, isDarkMode);
    notifyListeners();
  }

  void loadMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    isDarkMode = prefs.getBool(ThemePrefences.key.name) ?? false;

    notifyListeners();
  }
}
