import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_font.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.width = 500,
      this.color});
  final String text;
  final Function()? onPressed;
  double? width;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Text(
          text,
          style: AppFont.button,
        ),
      ),
    );
  }
}
