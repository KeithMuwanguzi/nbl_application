import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.accentColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: TextTheme(
        displayLarge: TextStyles.headline1,
        displayMedium: TextStyles.headline2,
        bodyLarge: TextStyles.bodyText1,
        bodyMedium: TextStyles.bodyText2,
        labelLarge: TextStyles.button,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.buttonColor,
        textTheme: ButtonTextTheme.primary,
      ),
      appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor,
      ),
    );
  }
}
