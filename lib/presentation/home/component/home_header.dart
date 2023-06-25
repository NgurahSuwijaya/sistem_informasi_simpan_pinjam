import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/home/controllers/home.controller.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';

class HomeHeader extends StatelessWidget {
  final HomeController controller;
  HomeHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Obx((() => CircleAvatar(
                backgroundImage: NetworkImage(
                    'http://10.0.2.2:8000${controller.simpananData.value.member!.user.photoPath}',
                    scale: 1),
                radius: 30,
              ))),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx((() => Text(
                    controller.simpananData.value.member!.user.name,
                    style: AppFont.h2,
                  ))),
              SizedBox(
                height: 5,
              ),
              Text(
                'Semoga Harimu Menyenangkan',
                style: AppFont.subtitle1,
              ),
            ],
          ),
        ],
      ),
      IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.bell_fill,
            color: AppColor.gray4,
          ))
    ]);
  }
}
