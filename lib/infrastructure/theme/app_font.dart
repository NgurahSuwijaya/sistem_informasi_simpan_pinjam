import 'package:flutter/material.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';

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
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.blackComponent);

  static TextStyle get hint => const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.blackComponent);

  static TextStyle get subtitle1 => const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColor.blackComponent);

  static TextStyle get subtitle2 => const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.blackComponent);

  static TextStyle get subtitle3 => const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.blackComponent);

  static TextStyle get subtitle4 => const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColor.blackComponent);

  static TextStyle get button => const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColor.blackComponent);
}
