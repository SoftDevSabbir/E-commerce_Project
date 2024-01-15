import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeData{
  static ThemeData lightThemeData= ThemeData(

      progressIndicatorTheme:
      ProgressIndicatorThemeData(color: AppColors.primaryColor),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 8,
            horizontal: 16),
        hintStyle: TextStyle(color: Colors.grey.shade400),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            )),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            )),
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),

              foregroundColor: Colors.white
          )
      ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
      )
    )
  );
}