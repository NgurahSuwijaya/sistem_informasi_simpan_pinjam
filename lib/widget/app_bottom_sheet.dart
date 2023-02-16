import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_font.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.22,
      margin: EdgeInsets.only(top: 30, left: 10, right: 10),
      child: Column(children: [
        Text(
          "Pilih Sumber Foto",
          style: AppFont.h1,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: (() {}),
                  icon: Icon(CupertinoIcons.photo),
                  iconSize: 40,
                  color: AppColor.gray2,
                ),
                Text(
                  "Gallery",
                  style: AppFont.subtitle1,
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: (() {}),
                  icon: Icon(CupertinoIcons.camera_fill),
                  iconSize: 40,
                  color: AppColor.gray2,
                ),
                Text(
                  "Camera",
                  style: AppFont.subtitle1,
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
