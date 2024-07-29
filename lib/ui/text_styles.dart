import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle _baseStyle(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  // Heading Text
  static TextStyle headingH1 = _baseStyle(24, FontWeight.bold);
  static TextStyle headingH2 = _baseStyle(18, FontWeight.bold);
  static TextStyle headingH3 = _baseStyle(16, FontWeight.bold);
  static TextStyle headingH4 = _baseStyle(14, FontWeight.bold);
  static TextStyle headingH5 = _baseStyle(12, FontWeight.bold);

  // Body Text
  static TextStyle bodyXl = _baseStyle(18, FontWeight.normal);
  static TextStyle bodyL = _baseStyle(16, FontWeight.normal);
  static TextStyle bodyM = _baseStyle(14, FontWeight.normal);
  static TextStyle bodyS = _baseStyle(12, FontWeight.normal);
  static TextStyle bodyXs = _baseStyle(10, FontWeight.normal);

  // Action Text
  static TextStyle actionL = _baseStyle(14, FontWeight.w600);
  static TextStyle actionM = _baseStyle(12, FontWeight.w600);
  static TextStyle actionS = _baseStyle(10, FontWeight.w600);
}
