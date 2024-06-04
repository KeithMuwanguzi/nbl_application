import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

class AppTheme {
  final TextStyles styles;

  AppTheme({required this.styles});

  ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.accentColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: TextTheme(
        displayLarge: styles.headline1,
        displayMedium: styles.headline2,
        bodyLarge: styles.bodyText1,
        bodyMedium: styles.bodyText2,
        labelLarge: styles.button,
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
