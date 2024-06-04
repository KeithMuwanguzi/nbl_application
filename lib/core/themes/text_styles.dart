import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class TextStyles {
  static final TextStyle headline1 = GoogleFonts.roboto(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static final TextStyle headline2 = GoogleFonts.roboto(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static final TextStyle bodyText1 = GoogleFonts.roboto(
    fontSize: 16.0,
    color: AppColors.textColor,
  );

  static final TextStyle bodyText2 = GoogleFonts.roboto(
    fontSize: 14.0,
    color: AppColors.textColor,
  );

  static final TextStyle button = GoogleFonts.roboto(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryColor,
  );
}
