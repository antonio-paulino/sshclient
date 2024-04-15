import 'package:flutter/material.dart';
import 'package:sshclient/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightmode;
  final String key = 'theme';

  ThemeProvider() {
    // _getTheme();
    _loadThemeFromPrefs();
  }

  ThemeData get themeData => _themeData;

  bool get _isDarkMode => _themeData == darkmode;

  set themeData (ThemeData newThemeData){
    _themeData = newThemeData;
    _saveToPrefs(newThemeData == lightmode? 'light' : 'dark');
    notifyListeners();
  }
  
  void toggleTheme(){
    themeData = _isDarkMode ? lightmode : darkmode;
  }

  Future <void> _loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeName = prefs.getString(key) ?? 'light';
    _themeData = themeName == 'light' ? lightmode : darkmode;
    notifyListeners();
  }

  Future <void> _saveToPrefs(String themeName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, themeName);
  }
}