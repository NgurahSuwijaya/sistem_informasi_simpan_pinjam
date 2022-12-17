import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_font.dart';

class AppInput extends StatefulWidget {
  final String hint;
  TextEditingController? controller;
  final bool obscureText;
  final Widget? prefixIcons;
  final Widget? sufixIcons;

  AppInput(
      {super.key,
      required this.hint,
      this.controller,
      required this.obscureText,
      this.prefixIcons,
      this.sufixIcons});

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.hint,
              style: AppFont.title1,
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: widget.controller,
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: const TextStyle(color: AppColor.gray2),
                  suffixIcon: widget.sufixIcons,
                  prefixIcon: widget.prefixIcons,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: AppColor.gray1))),
            ),
          ],
        ),
      ],
    );
  }
}
