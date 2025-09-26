import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme{
  AppTextTheme._();

  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    displayMedium: GoogleFonts.poppins(fontSize: 28.0, fontWeight: FontWeight.w500, color: Colors.white),
    displaySmall: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white),

    headlineLarge: GoogleFonts.oxygen(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.white),
    headlineMedium: GoogleFonts.oxygen(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.white),

    titleLarge: GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
    titleMedium: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),
    bodySmall: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(.68)),

  );
}