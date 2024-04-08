import 'package:flutter/material.dart';

import 'app_color.dart';

class AppFont {
  static TextStyle get h1 => const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColor.blackComponent);

  static TextStyle get h2 => const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.blackComponent);

  static TextStyle get title1 => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w800, color: AppColor.gray4);

  static TextStyle get title2 => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.green1);

  static TextStyle get title3 => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.gray4);

  static TextStyle get title4 => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w800, color: AppColor.green1);
  static TextStyle get title41 => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w800, color: AppColor.sRed);
  static TextStyle get title42 => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w800, color: AppColor.sPurple);
  static TextStyle get title43 => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w800, color: AppColor.sBlue);

  static TextStyle get hint => const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.blackComponent);

  static TextStyle get subtitle1 => const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColor.blackComponent);

  static TextStyle get subtitle2 => const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColor.gray1);

  static TextStyle get subtitle3 => const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.blackComponent);

  static TextStyle get subtitle4 => const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColor.blackComponent);

  static TextStyle get button => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w700, color: AppColor.white);
}
