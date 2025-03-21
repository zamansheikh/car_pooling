import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  // Base Fonts
  static TextStyle baseRegular = GoogleFonts.roboto(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
  static TextStyle baseMedium = GoogleFonts.roboto(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  // Small Fonts
  static TextStyle smallRegular = GoogleFonts.roboto(
    fontSize: 12.sp,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
  static TextStyle smallMedium = GoogleFonts.roboto(
    fontSize: 12.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  // D1 (Display) fonts
  static TextStyle displayBold = GoogleFonts.roboto(
    fontSize: 40.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
  static TextStyle displaySemibold = GoogleFonts.roboto(
    fontSize: 40.sp,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  // Header Fonts
  // Header 1
  static TextStyle headerBold1 = GoogleFonts.roboto(
    fontSize: 48.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
  static TextStyle headerSemibold1 = GoogleFonts.roboto(
    fontSize: 48.sp,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  // Heaeder 3
  static TextStyle headerBold3 = GoogleFonts.roboto(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
  static TextStyle headerRegular3 = GoogleFonts.roboto(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
  // Header 5
  static TextStyle headerBold5 = GoogleFonts.roboto(
    fontSize: 20.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
  static TextStyle headerMedium5 = GoogleFonts.roboto(
    fontSize: 20.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  // Large fonts
  static TextStyle largeMedium = GoogleFonts.roboto(
    fontSize: 18.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}
