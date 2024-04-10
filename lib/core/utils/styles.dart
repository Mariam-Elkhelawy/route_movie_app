import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle displaySmall = GoogleFonts.poppins(
      fontSize: 10.sp, color: Colors.white, fontWeight: FontWeight.w400);
  static TextStyle bodyLarge = GoogleFonts.inter(
      fontSize: 22.sp, fontWeight: FontWeight.w400, color: Colors.white);
  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white.withOpacity(.67),
  );
  static TextStyle bodyMedium = GoogleFonts.inter(
      fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white);
  static TextStyle titleAppBar = GoogleFonts.inter(
      fontSize: 20.sp, fontWeight: FontWeight.w400, color: Colors.white
  );
}
