import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = Locale('bn');

  Locale get currentLocale => _currentLocale;

  // LanguageProvider(){
  //   _getLocale();
  // }

  Future<void> changeLanguage() async{
    Locale locale = await _getLocale();
    _currentLocale = locale;
    notifyListeners();
  }

  void changeLocale(Locale newLocale){
    if(_currentLocale == newLocale) return;

    _currentLocale = newLocale;
    _saveLocale(_currentLocale.languageCode);
    notifyListeners();
  }

  Future<void> _saveLocale(String locale) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('locale', locale);
  }

  Future<Locale> _getLocale() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String savedLocal = sharedPreferences.getString('locale') ?? 'en';
    return Locale(savedLocal);
  }
}