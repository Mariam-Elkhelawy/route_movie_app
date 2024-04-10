import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_movie_app/core/utils/app_colors.dart';
import 'package:route_movie_app/core/utils/styles.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.bgColor,
    appBarTheme:const AppBarTheme(
      iconTheme:  IconThemeData(color: AppColor.whiteColor),
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
