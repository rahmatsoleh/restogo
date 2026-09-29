import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  Future<void> changeTheme() async {
    isDarkMode = !isDarkMode;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDarkMode", isDarkMode);
    notifyListeners();
  }

  Future<void> loadMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    isDarkMode = prefs.getBool("isDarkMode") ?? false;

    notifyListeners();
  }
}
