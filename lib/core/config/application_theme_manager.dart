import 'package:flutter/material.dart';

import '../colors_palette.dart';

class ApplicationThemeManager{
static ThemeData themeData=ThemeData(
  primaryColor: ColorsPalette.primaryColor,
textTheme: const TextTheme(
  titleLarge: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: 'Exo',
  ),
  titleMedium:  TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: 'Poppins',
  ),
  bodyMedium: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Color(0XFF4F5A69),
    fontFamily: 'Poppins',
  ),
  bodyLarge: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Color(0XFF303030),
    fontFamily: 'Poppins',
  ),
  bodySmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0XFF303030),
    fontFamily: 'Poppins',
  ),
),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 35,
    ),
    backgroundColor: ColorsPalette.primaryColor,
    centerTitle: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )
    ),


  ),

  );
}