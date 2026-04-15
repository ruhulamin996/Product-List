import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: AppColors.themeColor,
      scaffoldBackgroundColor: Colors.white,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.themeColor,
      ),

      appBarTheme: AppBarThemeData(
        centerTitle: true,
        backgroundColor: AppColors.themeColor,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )
      ),

      inputDecorationTheme: _getInputThemeDecoration(),
      filledButtonTheme: _getFilledButtonThemeData(),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: AppColors.themeColor,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.themeColor,
      ),
      inputDecorationTheme: _getInputThemeDecoration(),
      filledButtonTheme: _getFilledButtonThemeData(),
    );
  }

  static InputDecorationTheme _getInputThemeDecoration(){
    return InputDecorationTheme(
      contentPadding: .symmetric(horizontal: 12),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }

  static FilledButtonThemeData _getFilledButtonThemeData(){
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
          backgroundColor: AppColors.themeColor,
          textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          )
      ),
    );
  }
}
