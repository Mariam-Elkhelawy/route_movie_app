import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';


class AppTheme {
  static ThemeData appTheme = ThemeData(
    dialogBackgroundColor: AppColor.moviesContainerBgColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.bgAppBar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.bgColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColor.whiteColor),
      backgroundColor: AppColor.bgAppBar,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.bottomNavColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: AppColor.unselectedIconColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColor.primaryColor,
    ),
  );
}
