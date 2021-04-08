import 'package:flutter/material.dart';

class CustomColors {
  static const Color mainColor = Color(0xff0a043c);
  static const Color secondColor = Color(0xff03506f);
  static const Color lowPriorityColor = Color(0xffa3ddcb);
  static const Color verylowPriorityColor = Color(0xffffe3de);

  static const Color backgroundCatColor = Color(0xffc7c7c7);
  static const Color greyColor = Color(0xffF8F8F8);
  static const Color whiteColor = Color(0xffFFFFFF);

  static const Color transparentColor = Colors.transparent;

  static const Color subTitleColor = Color(0xff666666);
  static const Color titleBlackColor = Color(0xff000000);
  // static const Color mainColor = Color(0xff2196F3);
  // static const Color secondColor = Color(0xff0648a9);
  // static const Color backgroundCatColor = Color(0xffc7c7c7);
  // static const Color greyColor = Color(0xffF8F8F8);
  // static const Color whiteColor = Color(0xffFFFFFF);

  // static const Color transparentColor = Colors.transparent;

  // static const Color subTitleColor = Color(0xff666666);
  // static const Color titleBlackColor = Color(0xff000000);
}

ThemeData lightTheme = ThemeData(
  primaryColor: CustomColors.mainColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: CustomColors.secondColor,
    unselectedItemColor: CustomColors.titleBlackColor,
    unselectedIconTheme: IconThemeData(
      size: 30,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 16,
    ),
    selectedIconTheme: IconThemeData(
      size: 30,
    ),
    selectedLabelStyle: TextStyle(
      fontSize: 16,
    ),
    showSelectedLabels: true,
    elevation: 0,
  ),
  iconTheme: IconThemeData(
    color: CustomColors.titleBlackColor,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 28,
      fontFamily: "PTSans",
      color: CustomColors.subTitleColor,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: "PTSans",
      color: CustomColors.titleBlackColor,
      fontSize: 22,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "PTSans",
      color: CustomColors.subTitleColor,
      fontSize: 18,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.w800,
      fontFamily: "PTSans",
      color: CustomColors.subTitleColor,
      fontSize: 14,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: "PTSans",
      color: CustomColors.subTitleColor,
      fontSize: 12,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: "PTSans",
      color: CustomColors.subTitleColor,
      fontSize: 8,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: "PTSans",
      color: CustomColors.subTitleColor,
      fontSize: 10,
    ),
  ),
);
