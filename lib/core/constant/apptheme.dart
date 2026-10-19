import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/dimensions.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: AppColor.primaryColor,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: Dimensions.appBarTitleSize,
      fontWeight: FontWeight.w600,
    ),
    centerTitle: true,
    elevation: 0,
  ),

  fontFamily: "PlayfairDisplay",
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 27,
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 32,
      color: Colors.black,
    ),

    bodySmall: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
  ),
);

ThemeData themeArabic = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: AppColor.primaryColor,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: Dimensions.appBarTitleSize,
      fontWeight: FontWeight.w600,
    ),
  ),
  fontFamily: "Cairo",
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 27,
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 32,
      color: Colors.black,
    ),

    bodySmall: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
  ),
);
