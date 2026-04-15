import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController with ChangeNotifier{
  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeController(){
    loadTheme();
  }

  void toggleTheme(bool value) async{
    _isDark = value;
    notifyListeners();

    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isDark', _isDark);
  }

  void loadTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _isDark = sharedPreferences.getBool('isDark') ?? false;
    notifyListeners();
  }
}