import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nbl/core/util/responsive.dart';
import 'colors.dart';

class TextStyles {
  final Responsive res;

  TextStyles({required this.res});

  TextStyle get headline1 => GoogleFonts.roboto(
        fontSize: res.largeText(),
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      );

  TextStyle get headline2 => GoogleFonts.roboto(
        fontSize: res.mediumText(),
        fontWeight: FontWeight.w600,
        color: AppColors.textColor,
      );

  TextStyle get bodyText1 => GoogleFonts.roboto(
        fontSize: res.smallText(),
        color: AppColors.textColor,
      );

  TextStyle get bodyText2 => GoogleFonts.roboto(
        fontSize: res.ultraSmallText(),
        color: AppColors.textColor,
      );

  TextStyle get button => GoogleFonts.roboto(
        fontSize: res.smallText(),
        fontWeight: FontWeight.w600,
        color: AppColors.secondaryColor,
      );
}
