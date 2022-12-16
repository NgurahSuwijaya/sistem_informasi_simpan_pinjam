import 'package:flutter/material.dart';

class AppColor {
  static const Color green1 = Color(0xFF14B8A6);
  static const Color gray1 = Color(0xFFBCBABA);
  static const Color blackComponent = Color(0xFF6F6F6F);
  static const Color yellow1 = Color(0xFF48B814);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray2 = Color(0xFF8F8F8F);

  static const kColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: green1,
      onPrimary: white,
      secondary: yellow1,
      onSecondary: gray1,
      error: Colors.red,
      onError: white,
      background: gray1,
      onBackground: white,
      surface: white,
      onSurface: gray2);
}
